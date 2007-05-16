From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 08:57:02 +0200
Subject: [Buildroot] Busybox console wont show up
In-Reply-To: <1b0abb4c0705151823g2b1962dbr887718c64c435a37@mail.gmail.com>
References: <1b0abb4c0705141717m43eeef65r4e0a593e21dc87e7@mail.gmail.com>
	<1179263458.29753.7.camel@localhost>
	<1b0abb4c0705151426h733d9491xdd5228fe3d980ea@mail.gmail.com>
	<1b0abb4c0705151823g2b1962dbr887718c64c435a37@mail.gmail.com>
Message-ID: <20070516065702.GJ24585@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2007 at 06:23:20PM -0700, Ajay Sharma wrote:
>Hi All,
>
>Yesterday I reported having problems with busybox login not showing up after
>i was successfully able to create both a kernel and system image for
>ixp425(ARM big-endian) reference board.
>Well I got the problem solved today. It was a simple busybox rebuild.
>
>$make busybox-menuconfig
>configure busybox according to requirements
>and then
>$make busybox
>$make
>
>then copy the image to the target.
>It should boot.
>For reference I have attached a .config file for the busybox....
>
>Right now ...I am having trouble login in ...Whats the PASSWORD for the
>root? LOL

The password is not LOL but empty per default. I'm pretty sure that this
is documented somewhere..

HTH,
