function [L, U] = picketts(A)
    if size(A) == [1 1]
        L = [1]
        U = A
    elseif size(A) == [2 2]
        L11 = 1
        U11 = A(1,1)
        Lk1 = A(2,1)*U11
        u1k = A(1,2)
        vkk = A(end,end) - Lk1*u1k
        L = zeros(2,2)
        U = zeros(2,2)
        L(1,1) = L11
        L(2,1) = Lk1
        L(end,end) = 1
        U(1,1) = U11
        U(1,2) = u1k
        U(end,end) = vkk
    else
        [L11, U11] = picketts(A(1:end-1,1:end-1))
        Lk1 = A(2:end,1:end-1)*inv(U11)
        u1k = linsolve(L11, A(1:end-1,end))
        vkk = A(2:end,end) - Lk1*u1k
        vkk = vkk(end)
        [row, column] = size(A)
        L = zeros(row, column)
        U = zeros(row, column)
        L(1:end-1,1:end-1) = L11
        L(end,1:end-1) = Lk1(end,1:end)
        L(end,end) = 1
        U(1:end-1,1:end-1) = U11
        U(1:end-1,end) = u1k
        U(end,end) = vkk
    end  
end
