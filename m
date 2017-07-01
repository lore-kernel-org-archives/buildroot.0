From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:27:06 +0200
Subject: [Buildroot] [PATCH] package/lugaru: backport upstream fix
In-Reply-To: <20170630215707.11418-1-romain.naour@smile.fr>
References: <20170630215707.11418-1-romain.naour@smile.fr>
Message-ID: <20170701102706.0105639b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 23:57:07 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/389/38917f8420695a9dbb24830fef04159252fceea0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...x-mismatched-usage-length-build-fail-on-g.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
