From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 19 Apr 2020 13:08:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-04-18
In-Reply-To: <20200419062638.A1A8920346@silver.osuosl.org>
References: <20200419062638.A1A8920346@silver.osuosl.org>
Message-ID: <8e4b6cc7-420a-5b19-c580-85528c1a770d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 4/19/20 8:26 AM, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuild statistics for 2020-04-18
> ===============================
> 
>        branch |  OK | NOK | TIM | TOT |
>    2019.02.x  | 13  |  3  |  0  | 16  |
>    2019.11.x  | 20  | 11  |  0  | 31  |
>    2020.02.x  | 18  | 12  |  0  | 30  |
>      master   | 128 | 71  |  0  | 199 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>              lua-flu-20181218-1 | 7
>                lsqlite3-0.9.5-1 | 6
>      python-dataproperty-0.48.1 | 5
>              luaossl-20190731-0 | 4
>                         unknown | 4
>       python-argon2-cffi-19.2.0 | 3
>                  qt5base-5.14.2 | 3
>                    assimp-5.0.1 | 2
>                       avahi-0.8 | 2
>                  cracklib-2.9.7 | 2
>                   gnutls-3.6.13 | 2
>                host-grpc-1.25.0 | 2
>                  libselinux-3.0 | 2
>                 libupnpp-0.17.2 | 2
>                   lua-iconv-7-1 | 2
>                luaexpat-1.3.3-1 | 2
>                   openal-1.19.1 | 2
>          python-greenlet-0.4.15 | 2
>                      brltty-6.1 | 1
>                ejabberd-19.09.1 | 1
>                      gcr-3.34.0 | 1
>                   haproxy-2.1.4 | 1
>                   jbig2dec-0.16 | 1
>                libsecret-0.20.1 | 1
>               lirc-tools-0.10.1 | 1
>               lua-curl-0.3.11-1 | 1
>          luadbi-sqlite3-0.7.2-1 | 1
>                     mimic-1.1.0 | 1
>                      mpv-0.29.1 | 1
>                 nfs-utils-2.4.3 | 1
>                   openssh-8.2p1 | 1
>            python-enum34-1.1.10 | 1
>                 qt5webkit-5.9.1 | 1
>                     vlc-3.0.9.2 | 1
>                wsapi-fcgi-1.7-1 | 1
> 
> 
> Detail of failures
> ------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/6eb19d019480eb82a3291400704990745dd7c684 |
>    mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/74e45df0aa4a9811d77adb6f77fc02b8013a7120 |
>      mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/78196e7bf15c64d40affdc40e84e179d296a5f28 | ORPH
>     nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/66d27a8cbc6a9bef804a297396a4c05819ba59b9 | ORPH
> powerpc64le  |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/1a84c4178c609c7eb45b681d471b0533cb502156 |
>      arm      |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/638f2e67b20d99994f1ccc08a9ecc32a2e3c3a40 |
>      m68k     |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/4700ada7cee058d6b5cbbc39af511c5e250f42b8 |
>      arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/e09e91e1d9258f0abe4a8f89fc4e0af00e1c647f |
>    aarch64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/bc901026d177af93a9409d1f0d52a1ff25d33190 | ORPH
>      or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1d615b9cc7b3bff2f17863572714fa632002fbb5 |
>      or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/254a948bfefa7dd3cabc337b3b657285822569d4 |
>      m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/1bdbd7235eaeeafcd393c3de128c79382a789b9a |
>      i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c3d00e9936a81058ac3062777340b067fa4d3bc |
>    mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/35c3b0ed97259d06b71643879f9c8b94ee06f756 |
> powerpc64le  |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/71765eb976a4d40e377b3bcca094b13927f00bd8 |
>    riscv32    |        libsecret-0.20.1        | NOK | http://autobuild.buildroot.net/results/29033d3cb0c3237524330f8dbf4ac33fef4455ad | ORPH
>      arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/0c9a1351a0d3ce3a8dbe49fe3751f02bab2832aa |
>      arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/59936a6fa7a773956b3fc84a867f3264737f78e7 |
>      arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e42803dc80fc1af18baa4631e7c9ce46c4187c76 |
>      arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d47a0f7add2eb3fcf87138462e34c8eb2008af77 |
>      arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/dffb16abfb21413fb08b081b1be94f94d445bf2a |
>      arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/18a92db4ff074d49549c8561d058bd1ceb3acadb |
>      arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/641ce671ce22e802850f1a5bbc96839e0b9f0c9e |
>      arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/da9fa4dcd67cd9c3d1d8577fc648a65e7f34f6d7 |
>      arc      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/79cb9bb71f43a82ceba406e81587fd1f6866e42b |
>   aarch64_be  |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/7b18dab5e82e05ea94dcbc8723503ce8400e9c33 |
>    mips64el   |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/69e0a70b62ef60f0dbf0eee937c728f8cf728d50 |
>     x86_64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/82d6dbcaee6f684c6d7194b26a75c16eafb6bbdd |
>    mips64el   |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/898278c13ea2e0ebbd76e63210a50540906b8600 |
>    powerpc    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/c5b262f798deb1397be3e627e04545607e97bb8e |
>    mips64el   |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/a53cbafe02fb246563c6344e9a6b99381eb21f18 |
>    riscv64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/6cf270eafacd9dbcd1a953118fc12e0b7136e66c |
>      arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/feb5c5a81070c9faa4e4ab141e7346c7f0eccd4e |
>   aarch64_be  |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/379c30c91b9738448c622758f4d5baff25ed7fd2 |
>      arc      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/a93642572bd9ead94b74e79c1700cc59bec624c3 |
>    riscv64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/e8f64b2de0c5b2333ebf76135d009da3234f8fd6 |
>   aarch64_be  |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/072c657697fe63cb6b42c0d269164c543748c3c7 |
>     xtensa    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/3ef401ab10788e55fc6e9c4c1921b15f8eaa550f |
>      arc      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/29322497a0ea7079a03cec7a7843fb32e1b8411b |
>     x86_64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/6e7fc397917e8935f04393ce990e84751feac926 |
>     sparc     |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/d2c9412e1eb4dd8325c0b9c7d9d941d1c5a2e921 |
>    aarch64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/300ae0162cdeb51b8a9ce7abd4412419908e4870 |
>     x86_64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/4f4c61ddbf9fed486af249bba1e74a342b32743c |
>      arm      |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/074fb216729fff372252eb8c74d4459a27cef05e |
>    powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e57189778eb7442cf8531ae58bacf9b847044557 |
>    riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f90b4d96a22f6989f46f707a922feac837334e38 |
>      arm      |        nfs-utils-2.4.3         | NOK | http://autobuild.buildroot.net/results/1399e38c49967b44fb797e0353028283427db236 |

This ^^^ is fixed by:
https://patchwork.ozlabs.org/project/buildroot/patch/20200417153314.37637-1-giulio.benetti at benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
