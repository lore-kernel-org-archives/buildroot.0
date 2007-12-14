From: hartleys <hartleys@visionengravers.com>
Date: Thu, 13 Dec 2007 19:25:59 -0500
Subject: [Buildroot] UrJTAG (fork of openwince jtag tools)
Message-ID: <1CF6EDDF0820924DA43C9A52FE73259506D0761E@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

Has anyone tried building UrJTAG under buildroot?

http://urjtag.wiki.sourceforge.net

I'm trying to cross compile the package for use on an ARM processor
(Cirrus
EP93xx family) and can't figure out how to create the necessary .mk
file.

UrJTAG consists of two packages. An include package with a bunch of
support
stuff and the main source package. Both of these are configured normally
by
executing two autogen.sh scripts. I really don't understand how the
automake
stuff works so I can't work out what I need to do to get it to work with
buildroot. I can build the package with no problems on my host machine
but
need it for the ARM target.

Can anyone offer some suggestions or help?

Thanks,

Hartley
