From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:25:58 +0200
Subject: [Buildroot] [PATCH 2/3] php: cleanup patches
In-Reply-To: <1428507569-28044-2-git-send-email-gustavo@zacarias.com.ar>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
 <1428507569-28044-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408212558.1e1d0266@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 12:39:28 -0300, Gustavo Zacarias wrote:
> Convert patches from pure configure ones to *.m4/configure.in cleanness.
> This allows us to AUTORECONF (well, not quite, but close).
> Even though upstream will probably not accept them it's the right way.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Could you anyway try to submit the patches upstream? The iconv patch
will probably need some rework, but it would generally been good to
reduce the number of patches in Buildroot.

Nonetheless, patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
