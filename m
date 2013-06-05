From: David Kochner <david.kochner@gmail.com>
Date: Wed, 5 Jun 2013 12:12:02 +0300
Subject: [Buildroot] Buildroot 2013.05 + uClibc 0.9.30.2
Message-ID: <CACQMp4D5y1PQ8cBZa1esk=zuv_zgmU8eYwTVYE8=b5Ln39k-dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I am looking for a way to build the latest buildroot environment for
powerpc e500v2. It actually works pretty well for me. But I would like to
use a (much) older uClibc (0.9.30.2) as I need to compile binaries to run
on an old system that I can't upgrade.
I tried forcing the uClibc from 2010.02 to the latest 2013.05 release, it
works (sort of) but I need to fix a lot of compilation issues along the
build (not finished yet...) and I still didn't manage to successfully
compile it.
Sicne tools like crosstool-ng are able to use older uClibc I assume there
should be a way to do it.
I was wondering if there is an "official" or "recommended" way to do this.
When I try to statically build binaries using a newer uClibc and put it on
my target machine they crash.

Right now I am facing 3 options:
1. Use old buildroot (2010.02) that support uClibc 0.9.30.2 but cannot
build e500v2 binaries (can I just build generic ppc and get it over with?)
2. Use the newer buildroot (2013.05) and test my applications thoroughly to
make sure the the old uClibc on my target doesn't cause me any issues
3. Force the older uClibc on the newer buildroot...

Any suggestions would be appreciated.
Thank you very much.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130605/75aec58c/attachment-0001.html>
