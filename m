From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 23:32:58 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <979834e4-a338-525b-c7fd-1241c72127fb@micronovasrl.com> (Giulio
 Benetti's message of "Thu, 15 Feb 2018 23:06:28 +0100")
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <87lgfum0aq.fsf@dell.be.48ers.dk>
 <6f81dc33-b3a2-223e-1628-aed8a2e1e747@micronovasrl.com>
 <87vaexlxld.fsf@dell.be.48ers.dk>
 <979834e4-a338-525b-c7fd-1241c72127fb@micronovasrl.com>
Message-ID: <87mv09lw85.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Hi,
 > Il 15/02/2018 23:03, Peter Korsgaard ha scritto:
 >>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
 >> 
 >> Hi,
 >> 
 >> > Thank you very much for helping me on this,
 >> > it was not so easy as first package to me.
 >> 
 >> You are welcome, thank you for contributing!
 >> 
 >> As you perhaps noticed, I've also bumped the sunxi-mali-mainline-driver
 >> version for 4.15 support:
 >> 
 >> https://git.busybox.net/buildroot/commit/?h=next&id=1d339809d61aeed2911291830581f643596a2e5c

 > Yes, I've seen, I'm almost trying to rebuild.
 > I've seen you use quilt before calling build.sh script.
 > But build.sh should call it by itself.

No, I'm NOT using quilt. quilt is not a required dependency for
Buildroot (and we don't have a host-quilt package), so I'm tweaking
build.sh to use our apply-patches.sh script like we use to apply our
patches instead of quilt.

 > Ah, one question, you figure as Author because you've reworked heavily
 > the patch, right? (and it seems more than right to me)
 > Or was it a mistake?

Ups, that was mistake. I wanted to keep you authorship for the 2
patches, but me for the version bump - But apparently git ends up
changing the authorship when you squash commits which I did to apply the
various fixups - Sorry about that!

-- 
Bye, Peter Korsgaard
