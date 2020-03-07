From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:44:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: fix build on mips
In-Reply-To: <20200228084435.3964164-1-fontaine.fabrice@gmail.com>
References: <20200228084435.3964164-1-fontaine.fabrice@gmail.com>
Message-ID: <20200307224409.25ffb18b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 09:44:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d0ab5334f195a400a6d6dd6c49e3c1a2001b2b70
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ruby/ruby.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
