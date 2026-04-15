-- 3 kịch bản mà người dùng có thể vô tình hoặc cố ý tạo ra:
-- Nhập số tiền không hợp lệ: Người dùng nhập số tiền âm nhằm hack hệ thống để tăng số dư, Nhập 0 đồng để tạo record rác, Nhập số tiền quá nhỏ hoặc quá lớn.
-- Thực hiện giao dịch khi không đủ số dư.
-- Định dang sai đơn vị tiền tệ. (VND nhưng nhập số tiền dưới dạng số thực (float)).

CREATE DATABASE e_wallet;
USE e_wallet;

CREATE TABLE users (
	userId INT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE e_wallet (
	walletId INT PRIMARY KEY,
    balance DECIMAL(10,0) NOT NULL DEFAULT 0 CHECK(balance >= 0),
    userId INT NOT NULL UNIQUE,
    FOREIGN KEY (userId) references users(userId)
);

CREATE TABLE transactions (
	transactionId INT PRIMARY KEY,
    amount DECIMAL(10, 0) NOT NULL CHECK(amount > 0),
    transactionType VARCHAR(20) NOT NULL,
    transactionTime DATETIME NOT NULL,
    transactionStatus VARCHAR(20) NOT NULL,
    walletId INT NOT NULL UNIQUE,
    FOREIGN KEY (walletId) references e_wallet(walletId)
);

SELECT * FROM users;
SELECT * FROM e_wallet;
SELECT * FROM transactions;