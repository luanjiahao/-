
function checkWin(board) {
    for (var i = 0; i < board.length; i++) {
        for (var j = 0; j < board[i].length; j++) {
            // 水平方向检查
            if (j + 4 < board[i].length) {
                if (checkHorizontal(board, i, j)) {
                    return true;
                }
            }
            // 垂直方向检查
            if (i + 4 < board.length) {
                if (checkVertical(board, i, j)) {
                    return true;
                }
            }
            // 正对角线方向检查
            if (i + 4 < board.length && j + 4 < board[i].length) {
                if (checkDiagonal(board, i, j)) {
                    return true;
                }
            }
            // 反对角线方向检查
            if (i - 4 >= 0 && j + 4 < board[i].length) {
                if (checkAntiDiagonal(board, i, j)) {
                    return true;
                }
            }
        }
    }
    return false;
}

function checkHorizontal(board,  row,  col) {
    var count = 1;
    for (var i = 1; i < 5; i++) {
        if (board[row][col + i]!='' && board[row][col + i] == board[row][col]) {
            count++;
        }
    }
    return count == 5;
}

function checkVertical(board,  row,  col) {
    var count = 1;
    for (var i = 1; i < 5; i++) {
        if (board[row + i][col]!='' && board[row + i][col] == board[row][col]) {
            count++;
        }
    }
    return count == 5;
}

function checkDiagonal(board,  row,  col) {
    var count = 1;
    for (var i = 1; i < 5; i++) {
        if (board[row + i][col + i]!='' && row + i < board.length && col + i < board[row + i].length &&
            board[row + i][col + i] == board[row][col]) {
            count++;
        }
    }
    return count == 5;
}

function checkAntiDiagonal(board,  row,  col) {
    var count = 1;
    for (var i = 1; i < 5; i++) {
        if (board[row - i][col + i]!='' && row - i >= 0 && col + i < board[row - i].length &&
            board[row - i][col + i] == board[row][col]) {
            count++;
        }
    }
    return count == 5;
}
