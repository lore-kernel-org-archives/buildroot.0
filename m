From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 09:06:57 +0100
Subject: [Buildroot] [PATCH] util-linux: disable useless programs in the
 host package
In-Reply-To: <20180126001652.7235-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 25 Jan 2018 22:16:52 -0200")
References: <87lgglln4t.fsf@dell.be.48ers.dk>
 <20180126001652.7235-1-casantos@datacom.ind.br>
Message-ID: <87vafpjb6m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Disable all programs that depend on ncurses, as well as utilities that
 > are useless on the host: agetty, chfn-chsh, chmem, login, lslogins,
 > mesg, more, newgrp, nologin, nsenter, pg, rfkill, schedutils, setpriv,
 > setterm, su, sulogin, tunelp, ul, unshare, uuidd, vipw, wall, wdctl,
 > write, zramctl.

 > Also add dependency on host-zlib if host cramfs utils are to be built.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
