From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jan 2017 13:35:56 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <56c27c5a-07e1-3709-4bfc-60521b0a12c1@andin.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161217154629.09d3f0e3@free-electrons.com>
 <3e4baa3d-e4cf-0a3f-6508-f68f87012812@andin.de>
 <20161219102642.2b2b57e3@free-electrons.com>
 <d5fd9949-6575-05f0-6dbb-8d9df79869d6@andin.de>
 <20161221102024.71833cdc@free-electrons.com>
 <56c27c5a-07e1-3709-4bfc-60521b0a12c1@andin.de>
Message-ID: <20170103133556.66be6aa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Jan 2017 09:55:13 +0100, Andreas Naumann wrote:

> > If you look at your patch switching to 5.8 there is in fact very, very
> > little change in the .mk files, so that can be handled with a bunch of
> > ifeq () conditions.  
> 
> Ok, so the policy for the future would be to support 5.6/LTS + latest 
> release?

Yes, latest LTS and latest release.

> For the hash files, is it possible to just add another line?

Yes, it is possible to have as many lines as you want in a hash file,
matching different files.

> About how to go on: I'm not clear if my v4 set stayed without comments, 
> for above not being integrated or just Christmas/New Years.

People haven't had the time to review it. I will not personally be able
to look into it within the next two weeks, but hopefully someone else
can have a look.

However, I guess we need a version of the series that keeps the LTS
version around.

> Also, the proposed release date of 5.8 moved to the 17th of January
> in the meanwhile. What would be a good next step?

Definitely.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
