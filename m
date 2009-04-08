From: Lloyd Sargent <lsargent@txdigital.com>
Date: Wed, 8 Apr 2009 12:13:21 -0500
Subject: [Buildroot] DBUS keeps getting installed...
Message-ID: <200904081213.21064.lsargent@txdigital.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I'm really puzzled. In my initial build I had DBUS. Well, it was taking 
too many resources so I removed it.

Or so I thought.

In my next build, there was DBUS again!

So I checked the .config file:

# BR2_PACKAGE_DBUS is not set

Perhaps I misread something, but I was under the impression that if DBUS was 
not set, then it wouldn't be included in the build?

Any help would be appreciated. This has been going on for the last 20 or 30 
builds.

Cheers,

Lloyd
