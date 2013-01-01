From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jan 2013 22:14:19 +0100
Subject: [Buildroot] 2012.11.x bugfix release
Message-ID: <87fw2ksj10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI,

As promised, I'll do a 2012.11.1 bugfix release very soon. I've pushed a
2012.11.x bugfix branch earlier today:

http://git.buildroot.net/buildroot/log/?h=2012.11.x

Which contains:

Chris Zankel (1):
      xtensa: add -mlongcalls to CFLAGS for xtensa

Frank Hunleth (1):
      qt: fix qconfig configure parameter

Mikhail Boiko (1):
      dosfstools: fix download link

Peter Korsgaard (1):
      toolchain/gcc: also disable largefile for pass 1/2 if needed

Richard Braun (1):
      arch: fix BR2_ARCH for generic target variant


Let me know if I've missed anything important / any of these shouldn't
be included asap. I plan on releasing 2012.11.1 tomorrow.

Thanks.

-- 
Bye, Peter Korsgaard
