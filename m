From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:34:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/xvisor: fix build with gcc 10
In-Reply-To: <20201006202132.864896-1-fontaine.fabrice@gmail.com>
References: <20201006202132.864896-1-fontaine.fabrice@gmail.com>
Message-ID: <20201014233433.57e7c1cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Oct 2020 22:21:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b6070c0721b33824e71833ce53423979980aa598
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../xvisor/0001-fix-build-with-gcc-10.patch   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/xvisor/0001-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
