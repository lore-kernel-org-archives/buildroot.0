From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Mon, 28 Sep 2009 08:08:48 +0200
Subject: [Buildroot] at91bootstrap missing
Message-ID: <330EC2471BF24E48B513AF1A6975EB69B26337@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm baffled. I've been building buildroot with external toolchain and it
needed some tweaking to get it work. For example bootstrap needed to be
disabled because it had some problems so that I could continue
compiling.

Now that everything else is sorted out I was starting to work with the
at91bootstrap only to notice that I can't figure out how to enable it! I
even cloned new version of the buildroot from the Ulf's git-repository,
but still can't find the place where it's enabled and setup.

Any idea how it's enabled and what am I missing here? I see from
Config.in - files that it should be somewhere in target - settings, and
that's where it is in older buildroot, but now I can't find it there (or
anywhere else).

Teemu Keskinarkaus
