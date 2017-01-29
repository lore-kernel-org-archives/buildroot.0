From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:11:52 +0100
Subject: [Buildroot] [git commit] jsmn: new package
In-Reply-To: <87tw8j9ugd.fsf@dell.be.48ers.dk>
References: <20170128100442.D3EC581938@busybox.osuosl.org>
 <87tw8j9ugd.fsf@dell.be.48ers.dk>
Message-ID: <20170129141152.2002025a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 14:37:22 +0100, Peter Korsgaard wrote:

>  > +define JSMN_INSTALL_STAGING_CMDS
>  > +	$(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
>  > +	$(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h  
> 
> We normally use install -D to create the destination directories if
> needed. I agree that these directories are very likely to be created
> already, but for consistency -D would be nice.

Gaah. I knew I had done it. But it ended up in the wrong commit :-/

See
https://git.buildroot.org/buildroot/commit/?id=f9edac7ec45958ebd22f156f7ca859e1dbf0673a.

That's what happens when applying patches between two flights in an
airport I guess :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
