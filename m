From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Tue, 23 Feb 2021 09:25:50 +0100
Subject: [Buildroot] [PATCH] package/avrdude: Switch to upstream
In-Reply-To: <20210222211535.GF2276@scaer>
References: <20210222022606.491102-1-alexander.sverdlin@gmail.com>
 <20210222211535.GF2276@scaer>
Message-ID: <1fb4110698bd2c67f04061a8fc1320148540edd1.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, 2021-02-22 at 22:15 +0100, Yann E. MORIN wrote:
> > -AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
> > -AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
> > +AVRDUDE_VERSION = r1450
> > +AVRDUDE_SITE_METHOD = svn
> > +AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
> 
> I am wondering what version of Buildroot you've been testing this with,
> because downloading via svn is currently broken in master.
> 
> No need to reend for now, until we fix the svn download (imminent,
> anytime soon, almost done, etc...)

You've cought me :)
Tested with 2020.11.x, rebased onto master.

-- 
Alexander Sverdlin.
