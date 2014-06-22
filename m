From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:04:23 +0200
Subject: [Buildroot] [PATCH] libhid: fix for nommu
In-Reply-To: <1403441509-27982-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403441509-27982-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140622190423.0072c0cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 22 Jun 2014 09:51:49 -0300, Gustavo Zacarias wrote:
> Make it accept uclinux in the tuple as linux. Fixes:
> http://autobuild.buildroot.net/results/07f/07f2a560d9915ff7bad830be11f95aa856ce0e73/
> 
> Upstream seems dead with the last commit in svn being 5+ years ago and
> with some recent patches in the mailing list just sitting there.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
