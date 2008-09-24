From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 24 Sep 2008 15:19:38 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/lxdoom
In-Reply-To: <20080924131707.7856FF8008@busybox.net>
References: <20080924131707.7856FF8008@busybox.net>
Message-ID: <20080924151938.390e2c13@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Sep 2008 06:17:07 -0700 (PDT)
egtvedt at uclibc.org wrote:

> Author: egtvedt
> Date: 2008-09-24 06:17:07 -0700 (Wed, 24 Sep 2008)
> New Revision: 23467
> 
> Log:
> lxdoom: make package depend on X11 server
> 
> lxdoom depends on a X11 server to be built, this patch will only show
> lxdoom if a X11 server is selected and add xserver_xorg-server to the
> dependency list.
> 

Sorry, obviously missing a vital part of the patch here. I will revert
and recommit.

<snipp patch>

-- 
Best regards,
Hans-Christian Egtvedt
