From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 16:22:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/motion: fix build with gcc 10
In-Reply-To: <20200911195942.607943-1-fontaine.fabrice@gmail.com>
References: <20200911195942.607943-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913162250.5f2122ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 21:59:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/99d99dad219776e88aaedcaaf38eb4530d0870ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../motion/0001-Fix-build-with-GCC-10.patch   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/motion/0001-Fix-build-with-GCC-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
