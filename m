From: Chris Bare <chris@bareflix.com>
Date: Thu, 16 Apr 2009 17:23:16 -0400 (EDT)
Subject: [Buildroot] build process needs host executable
Message-ID: <20090416212454.5D43A1C806D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to add xmlrpc-c to buildroot, but one of the things the build does
is try to run an executable it just built. Obviously this doesn't work because
it is built for the target, not the host.

Can anyone point me to an example of how this was dealt with in other
packages?
In this case, I don't think the executable is needed on the target, it is just
part of the build process.
-- 
Chris Bare
chris at bareflix.com
