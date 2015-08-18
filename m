From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 23:15:30 +0200
Subject: [Buildroot] [PATCH v2] python-pyroute2: new package
In-Reply-To: <1439307326-11082-1-git-send-email-yegorslists@googlemail.com>
References: <1439307326-11082-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150818231530.42004468@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Tue, 11 Aug 2015 17:35:26 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: use the latest git version, that provides README.md as ASCII only file
> 	    add hook description

I've applied to next, after doing some additional changes:

    [Thomas:
      - fix legal info:
        * the license is GPLv2+ *or* Apache 2.0
        * the license files list separator is space, not comma
        * README.license.md has been added to the license files, since it
          contains some useful information about the licensing.
      - rewrap Config.in help text.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
