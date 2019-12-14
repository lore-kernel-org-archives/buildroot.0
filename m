From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 16:25:37 +0100
Subject: [Buildroot] [PATCH 1/2] package/ljsyscall: fix build with
 aarch64
In-Reply-To: <20191213220912.18906-1-fontaine.fabrice@gmail.com>
References: <20191213220912.18906-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214162537.062b00ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Dec 2019 23:09:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> luajit supports aarch64 since commit
> 2ca0accc21a090874ac6e97670b47153a1f0a0b5
> 
> However this raise a build failure with ljsyscall because aarch64
> directory does not exist so use arm64 instead
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3a0bd14349b3cab3e09d0b8b24ddab66dfab91ff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ljsyscall/ljsyscall.mk | 2 ++
>  1 file changed, 2 insertions(+)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
