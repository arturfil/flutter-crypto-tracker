import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:youtube_crypto/models/purchase.dart';

class PurchaseDatabaseProvider {
  PurchaseDatabaseProvider._();

  static final PurchaseDatabaseProvider db = PurchaseDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "youtube_crypto.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Purchase ("
          "id integer primary key,"
          "name TEXT,"
          "amount DOUBLE,"
          "atPrice DOUBLE)");
    });
  }

  Future<List<Purchase>> getAllPurchases() async {
    final db = await database;
    var response = await db.query("Purchase");
    List<Purchase> list = response.map((p) => Purchase.fromMap(p)).toList();
    return list;
  }

  Future<Purchase> getPurchaseById(int id) async {
    final db = await database;
    var response = await db.query("Purchase", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Purchase.fromMap(response.first) : null;
  }

  addPurchase(Purchase purchase) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Purchase");
    int id = table.first["id"];
    purchase.id = id;
    var raw = await db.insert(
      "Purchase",
      purchase.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updatePurchase(Purchase purchase) async {
    final db = await database;
    var response = await db.update("Purchase", purchase.toMap(),
      where: "id = ?", whereArgs: [purchase.id]);
    return response;
  }

  deletePurchaseWithId(int id) async {
    final db = await database;
    return db.delete("Purchase", where: "id = ?", whereArgs: [id]);
  }
}
