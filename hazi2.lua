-- https://stackoverflow.com/a/664611/9281022
function table.copy(t)
    local u = {}
    for k, v in pairs(t) do
        u[k] = v
    end
    return setmetatable(u, getmetatable(t))
end

function sum_list_rec(list)
    if table.maxn(list) == 0 then
        return 0
    else
        local l2 = table.copy(list)
        table.remove(l2, table.maxn(l2))
        return list[table.maxn(list)] + sum_list_rec(l2)
    end
end

function sum_list_rec_tail(list, running_sum)
    if running_sum == nil then
        running_sum = 0
    end
    if table.maxn(list) == 0 then
        return running_sum
    else
        local l2 = table.copy(list)
        table.remove(l2, table.maxn(l2))
        return sum_list_rec_tail(l2, list[table.maxn(list)] + running_sum)
    end
end

function fib_rec(n)
    if n < 1 then
        return 1
    else
        return fib_rec(n - 1) + fib_rec(n - 2)
    end
end

function fib_rec_tail(n, nm1, nm2)
    if nm1 == nil then
        nm1 = 0
    end
    if nm2 == nil then
        nm2 = 1
    end
    if n == 0 then
        return nm1 + nm2
    else
        return fib_rec_tail(n - 1, nm2, nm1 + nm2)
    end
end

function infinity_counter(n)
    print(n)
    return infinity_counter(n + 1)
end

print(sum_list_rec({1, 2, 3, 4, 5}))
print(sum_list_rec_tail({1, 2, 3, 4, 5}))
print(fib_rec(10))
print(fib_rec_tail(10))
infinity_counter(0)

-- A Lua normálisan optimalizálja a farokrekurziót
-- Az ezzel foglalkozó dokumentáció: https://www.lua.org/pil/6.3.html
-- A gyakorlati példa az `infinity_counter`, amely láthatóan a végtelenségig fut,
-- viszont a farokrekurzív hívások optimalizálása miatt nem szab neki határt a stack mérete
-- Ez az optimalizálás a dokumentáció szerint a teljes aktuális stack frame eldobása, ami
-- később nem fog kelleni, hiszen a funckió utolsó dolga a következő funkció (ebben az esetben saját maga) meghívása
