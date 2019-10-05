From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:38:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/c-icap: fix build with musl
In-Reply-To: <20190929075924.1041-1-fontaine.fabrice@gmail.com>
References: <20190929075924.1041-1-fontaine.fabrice@gmail.com>
Message-ID: <20191005223800.56cb6ab4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 09:59:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an upstream patch which includes various fixes including renaming
> PAGE_SIZE into DB_PAGE_SIZE which fix the build on musl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2ce70b92d7e4ad78aa0fd257a3b40a841489ab6d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ixes-to-compile-and-run-under-cygwin.patch | 390 ++++++++++++++++++
>  1 file changed, 390 insertions(+)
>  create mode 100644 package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
