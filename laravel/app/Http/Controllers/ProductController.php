<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        if ($request->is('api/*')) {
            // Logika jika permintaan datang dari API
            return response()->json(['message' => 'Ini adalah permintaan dari API'], 200);
        } else {
            // Logika jika permintaan datang dari aplikasi web
            return view('products.index');
        }
    }
}

public function index()
{
    // Logika untuk menampilkan daftar produk
}

public function create()
{
    // Logika untuk menampilkan formulir tambah produk
}

public function store(Request $request)
{
    // Logika untuk menyimpan produk baru
}

public function show($id)
{
    // Logika untuk menampilkan detail produk dengan ID tertentu
}

public function edit($id)
{
    // Logika untuk menampilkan formulir edit produk dengan ID tertentu
}

public function update(Request $request, $id)
{
    // Logika untuk menyimpan perubahan pada produk dengan ID tertentu
}

public function destroy($id)
{
    // Logika untuk menghapus produk dengan ID tertentu
}
