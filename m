From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:25:35 +0100
Subject: [Buildroot] [PATCH] libnetfilter_conntrack: fix static linking
In-Reply-To: <1421251363-13543-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421251363-13543-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114192535.1629c3d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 13:02:43 -0300, Gustavo Zacarias wrote:
> It has a hardcoded -ldl link invocation, so drop it. Fixes:
> http://autobuild.buildroot.net/results/66ba5f76694d0738b113463579ce6b2fa49a89d6/
> 
> Also add hash file and rename uclinux patch to new naming convention.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
