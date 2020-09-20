From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 16:07:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/gqview: fix build with gcc 10
In-Reply-To: <20200909193252.1248281-1-fontaine.fabrice@gmail.com>
References: <20200909193252.1248281-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920160735.6ca863b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Sep 2020 21:32:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ab19e23cae603b2aa6e696e4937d106883e78b76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../gqview/0002-fix-build-with-gcc-10.patch   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/gqview/0002-fix-build-with-gcc-10.patch

Applied to master, thanks. I have applied, but to be honest, I believe
we should drop gqview. It has been unmaintained since 2006. There is a
fork called geeqie. Perhaps it makes sense to package it... or not. I'm
not sure this kind of desktop-level applications are really that useful
in the context of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
