From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:19:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix build when
 __NR_signalfd is not available
In-Reply-To: <20200728124238.2824679-1-fontaine.fabrice@gmail.com>
References: <20200728124238.2824679-1-fontaine.fabrice@gmail.com>
Message-ID: <20200805231941.10e3584f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 14:42:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/75096a48d2dbda57459523db3ed0952e63f93535
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fail-if-__NR_signalfd-is-not-defined.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/lxc/0001-syscall-don-t-fail-if-__NR_signalfd-is-not-defined.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
