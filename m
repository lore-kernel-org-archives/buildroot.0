From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:24:42 +0200
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.4.5
In-Reply-To: <1444330752-31507-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444330752-31507-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151009152442.24f26ba0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Oct 2015 15:59:12 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2015-5289: json or jsonb input values constructed from arbitrary
> user input can crash the PostgreSQL server and cause a denial of
> service.
> 
> CVE-2015-5288: The crypt() function included with the optional pgCrypto
> extension could be exploited to read a few additional bytes of memory.
> No working exploit for this issue has been developed.
> 
> sparc build fix patch upstream so drop it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/postgresql/0002-fix-sparc-compile.patch | 38 -------------------------
>  package/postgresql/postgresql.hash              |  4 +--
>  package/postgresql/postgresql.mk                |  2 +-
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/postgresql/0002-fix-sparc-compile.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
