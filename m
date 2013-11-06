From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:42:58 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <OFF4942D87.38E368D2-ON86257C1B.007BE83F-86257C1B.007C242E@rockwellcollins.com>
 (clshotwe@rockwellcollins.com's message of "Wed, 6 Nov 2013 16:37:26
 -0600")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
 <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
 <87fvr9jh2h.fsf@dell.be.48ers.dk>
 <OFF4942D87.38E368D2-ON86257C1B.007BE83F-86257C1B.007C242E@rockwellcollins.com>
Message-ID: <87bo1xjgnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "clshotwe" == clshotwe  <clshotwe@rockwellcollins.com> writes:

Hi,

 >> I still don't quite get why you want to download the sources of all
 >> package(-versions) we have in Buildroot. Can you explain in more detail?

 > I do all of my builds behind a very restrictive firewall that does not
 > allow me to download the packages.  I am able to download them from
 > another computer and serve up the files behind the firewall.  It is
 > difficult to keep the sources up to date while tracking the Buildroot
 > mainline. 

So you have git access but not generic http access? An alternative could
be to grab the sources from sources.buildroot.net instead (but I only
update that one every wednesday).

You can get the needed tarball names using 'make external-deps'.

-- 
Bye, Peter Korsgaard
