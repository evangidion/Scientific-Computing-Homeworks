function [L, U] = shermans(A)
    if size(A) == [1 1]
        L = [1]
        U = A
    else
        [L11, U11] = shermans(A(1:end-1, 1:end-1))
        u1k = linsolve(L11, A(1:end-1, end))
        lk1 = linsolve(transpose(U11), transpose(A(end, 1:end-1)))
        vkk = A(end, end) - (transpose(lk1) * u1k)
        [row, column] = size(A)
        L = zeros(row, column)
        U = zeros(row, column)
        L(1:end-1, 1:end-1) = L11
        L(end, 1:end-1) = transpose(lk1)
        L(end, end) = 1
        U(1:end-1, 1:end-1) = U11
        U(1:end-1, end) = u1k
        U(end, end) = vkk
    end  
end
