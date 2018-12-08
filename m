From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 21:38:44 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.11.3
In-Reply-To: <20181207183702.4463-1-ps.report@gmx.net>
References: <20181207183702.4463-1-ps.report@gmx.net>
Message-ID: <20181208203844.GR2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-12-07 19:37 +0100, Peter Seiderer spake thusly:
> qt5base: remove 0005-Export-qt_open64-from-QtCore.patch (taken from upstream [1])
> 
> [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
[--SNIP--]
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> index a4fc20ebcf..c4f8fa81dd 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> @@ -1,8 +1,8 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
> +ed:   package/qt5/qt5script/qt5script.hash# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist

Irk? ;-)

This is no good, it breaks check-package:

    https://gitlab.com/buildroot.org/buildroot/-/jobs/131840389

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
