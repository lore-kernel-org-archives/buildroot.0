From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:18:25 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <20130731191825.5b7377e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 31 Jul 2013 19:14:15 +0200, Thomas Petazzoni wrote:

> http://patchwork.ozlabs.org/patch/181870 [1/9] firefox: host-python dependency needs --enable-unicodedata
> http://patchwork.ozlabs.org/patch/181871 [2/9] firefox: valgrind dependency needs --enable-tls for debug build
> http://patchwork.ozlabs.org/patch/181874 [3/9] firefox: sqlite dependency needs new compile-time options
> http://patchwork.ozlabs.org/patch/181872 [4/9] firefox: installing default extensions needs host-xmlstarlet dependency
> http://patchwork.ozlabs.org/patch/181875 [5/9] firefox: installing default extensions needs host-unzip dependency
> http://patchwork.ozlabs.org/patch/181877 [6/9] firefox: Mozilla Web Browser
> http://patchwork.ozlabs.org/patch/181876 [7/9] firefox: GNU gnash flash plugin needs agg dependency
> http://patchwork.ozlabs.org/patch/181873 [8/9] firefox: GNU gnash flash plugin needs gconf dependency
> http://patchwork.ozlabs.org/patch/181878 [9/9] firefox: GNU gnash flash, an open source Adobe Flash player & plugin

I'm proposing to drop those patches. The patches are from September
2012, and I asked Stefan Froberg in May 2013 whether he was still
interested
(http://lists.busybox.net/pipermail/buildroot/2013-May/071410.html),
and I've got a private answer that said:

"""
Well, those patches were for Firefox version 11.0 so it's quite old
already.

I have a patches for Firefox 16.0 & Firefox 18.0 done but as I
understand it Firefox is never
going to be included in buildroot so I did not post them.

And I have now also unsubscripted from mailing list so I can't post them
even if
someone would like to check them.

So, yeah. Those patches can be wiped out.

If someone from the list still want's them they can be found from
http://binarytouch.com/patches/
(I will put all the rest of my buildroot patches later there after I
have completed my current project)
"""

So unless anyone objects and steps up to refresh and resubmit those
patches, I'm proposing to mark those patches as rejected.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
