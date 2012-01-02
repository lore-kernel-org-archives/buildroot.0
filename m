From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 02 Jan 2012 19:54:25 +0100
Subject: [Buildroot] [git commit] u-boot: remove 2010.x versions,
	deprecate 2011.03 / 2011.06
In-Reply-To: <1325520589.2442.5.camel@emblysd024.adetel.com> (Alexandre
 Belloni's message of "Mon, 02 Jan 2012 17:09:49 +0100")
References: <20120102160217.580058FFBF@busybox.osuosl.org>
 <1325520589.2442.5.camel@emblysd024.adetel.com>
Message-ID: <87r4zi0wbi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <abelloni@adeneo-embedded.com> writes:

 Alexandre> Hi,
 Alexandre> Isn't that breaking all the at91sam def_configs ?

Ahh, yes - I've forgotten about those.

 Alexandre> I'm in the process of updating those configs to use uboot
 Alexandre> 2011.12 and linux 3.1. But until then, I guess those won't
 Alexandre> build anymore.

True. I've just updated the 9g20 defconfig, but please send your patches
for the others.

-- 
Bye, Peter Korsgaard
