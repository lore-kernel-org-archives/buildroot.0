From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:28:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/nanocom: fix build with gcc 10
In-Reply-To: <20200905101614.11502-1-fontaine.fabrice@gmail.com>
References: <20200905101614.11502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905232808.68943cdb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 12:16:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/4af4710cb9bbb1bc770b9824339dd7dbf8a80b05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../nanocom/0001-fix-build-with-gcc-10.patch  | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/nanocom/0001-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
