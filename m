From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 17:35:31 -0500
Subject: [Buildroot] Bug in pkg-stats?
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

The output of pkg-stats shows almost every package with the following status:

AUTOTARGETS GENTARGETS  CMAKETARGETS   manual
target host target host target host  target              Actions
  NO    NO    NO    NO    NO    NO     NO   YES  * convert to generic target

I don't think this output is correct but I can't figure out what's wrong
with the script.

Regards,
Hartley
