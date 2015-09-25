From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 09:34:31 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <871tdno5er.fsf@dell.be.48ers.dk>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
Message-ID: <20150925093431.4a39623e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Sep 2015 23:48:12 +0200, Peter Korsgaard wrote:

>  > So I could submit a huge bunch of defconfigs for all the Armada 370,
>  > XP, 375, 38x and 39x platforms that I have (it would probably be 15 to
>  > 20 defconfigs), but they would only differ by the name of the Device
>  > Tree in the defconfig. All the rest would be exactly the same. So I
>  > wasn't sure it was really worth adding 15 to 20 more defconfigs for a
>  > configuration that doesn't include the bootloader and where all
>  > configurations would be almost identical.
> 
> Couldn't we just do a single defconfig that builds all the dtb files and
> then add a README describing what dtb / how to boot on the various
> boards?

Right, we could do that. But it's really as simple as taking some
random mainline kernel version and build mvebu_v7_defconfig. It's not a
defconfig that has a lot of added-value.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
