From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 12:55:08 +0100
Subject: [Buildroot] [PATCH] samba4: specify ncurses-config
In-Reply-To: <1425638568-1345-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425638568-1345-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150306125508.6579d043@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  6 Mar 2015 07:42:48 -0300, Gustavo Zacarias wrote:
> When ncurses wide is enabled samba doesn't automatically find the
> appropiate ncurses-config script and finds the host variant (which is
> non-widec) which leaks improper library directories into the build.
> 
> samba4: specify ncurses-config

This was probably not intended to be here, so I removed it.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
