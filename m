From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:16:43 +0200
Subject: [Buildroot] [V2] ficl: new package
In-Reply-To: <1462295148-4335-1-git-send-email-francois.perrad@gadz.org>
References: <1462295148-4335-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160528151643.62f3cb0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 May 2016 19:05:48 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                    |  1 +
>  package/ficl/0001-fix-Makefile.patch | 47 ++++++++++++++++++++++++++++
>  package/ficl/Config.in               |  9 ++++++
>  package/ficl/ficl.hash               |  2 ++
>  package/ficl/ficl.mk                 | 59 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 118 insertions(+)
>  create mode 100644 package/ficl/0001-fix-Makefile.patch
>  create mode 100644 package/ficl/Config.in
>  create mode 100644 package/ficl/ficl.hash
>  create mode 100644 package/ficl/ficl.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
