From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 16:22:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: add patch for nds32
 support
In-Reply-To: <20190426080703.2604-1-nylon7@andestech.com>
References: <20190426080703.2604-1-nylon7@andestech.com>
Message-ID: <20190803162234.52531fab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nylon,

On Fri, 26 Apr 2019 16:07:03 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Fixes:
>   http://autobuild.buildroot.net/results/a2fc44575a900f2221c2a3a11491c527871555ee/
> 
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  ...0003-Improve-support-for-Linux-nds32.patch | 76 +++++++++++++++++++
>  ...direction-NDS32-stack-grows-downward.patch | 25 ++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
>  create mode 100644 package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch

Applied to master, thanks. However, please submit these changes to the
upstream libsigsegv project, we don't want to keep them forever as
patches in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
