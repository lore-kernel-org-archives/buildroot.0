From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:13:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk: add
 BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
In-Reply-To: <20190322225451.24545-1-fontaine.fabrice@gmail.com>
References: <20190322225451.24545-1-fontaine.fabrice@gmail.com>
Message-ID: <20190325181326.2d67ba29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Mar 2019 23:54:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openjdk does not support arc or riscv, see:
> https://github.com/openjdk/jdk/blob/d85131a4d11d5767ae3afacd8627a4a8f8cbab95/make/autoconf/platform.m4
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c5782d6b52516d07469adf6600d4fc69c4016157
>  - http://autobuild.buildroot.org/results/8437ebe0fd228c2d8856255411026f30e39778e3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openjdk/Config.in | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Ah sorry, I'm seeing this patch just now, and I've already applied
Adam's patch doing pretty much the same thing. My bad for taking the
patch in LIFO order :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
