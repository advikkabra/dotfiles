local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
    cpp = {
        snip({
            trig = "compet",
            name = "Competitive programming template",
            dscr = "Competitive programming template, for Codeforces and other websites etc.",
        }, {
            text({
                "#include <bits/stdc++.h>",
                "using namespace std;",
                "using ll = long long;",
                "#define fi(n) for (ll i = 0; i < n; i++)",
                "#define fj(n) for (ll j = 0; j < n; j++)",
                "#define mat vector<vector<ll>>",
                "#define all(v) v.begin(), v.end()",
                "#define rall(v) v.rbegin(), v.rend()",
                "#define endl '\\n'",
                "#define M 1000000007",
                "#define INF 10000000000000000",
                "#define vi vector<ll>",
                "#define pi pair<ll, ll>",
                "#define py(b) if (b) cout << \"YES\" << endl; else cout << \"NO\" << endl",
                "",
                "int main() {",
                "  ios::sync_with_stdio(false);",
                "  cin.tie(NULL);",
                "",
                "  "
            }), insert(0, ""),
            text({ "", "}" })
        }),
        snip({
            trig = "fileio",
            name = "Take input/output from files",
        }, {
            text({ "#ifndef ONLINE_JUDGE" }),
            text({ "", "freopen(\"" }),
            insert(2, "input.txt"),
            text({ "\", \"r\", stdin);", "//freopen(\"output.txt\",  \"w\", stdout);", "#endif", "" }),
        })

    },
})
