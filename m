From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Fri, 25 Sep 2015 09:07:51 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <5604FA37.7040205@gmail.com>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be> <20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
 <944894A3EB1D044A9003B2F944389BB20474C34C8C@svr-wa-exch1.atg.lc>
 <5604FA37.7040205@gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C34CAE@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

Thanks for sharing your experience. I will do it when I get back to this work.

Tommy

-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Stefan Peter
Sent: Friday, September 25, 2015 12:40 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] Building system for the Marvell's ARMADA A385 borad to resolve the VLAN trunk issue

Hi Tommy

Am 25.09.2015 um 00:53 schrieb Lee, Tommy:
> Hi,
> Yesterday I used one of four Marvell's DTB files with my 4.0.4 system zImage built with mvebu_v7_defconfig. The boot process automatically enabled only eth0.
>
> Unfortunately I do not have the DTS file for building that DTB file. I am reviewing the relevant DTS files, in the 2015.05 and Marvell's 2012.11 file systems, to try to resolve the eth1 enabling issue now.

dtc, the device tree compiler, can decompile dtb to dts. If memory serves right, you can use something along

dtc -I DTB -O DTS yourfile.dtb

With kind regards

Stefan Peter

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
