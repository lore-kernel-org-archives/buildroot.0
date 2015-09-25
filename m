From: Stefan Peter <st3fanp3t3r@gmail.com>
Date: Fri, 25 Sep 2015 09:39:35 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34C8C@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be> <20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
 <944894A3EB1D044A9003B2F944389BB20474C34C8C@svr-wa-exch1.atg.lc>
Message-ID: <5604FA37.7040205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tommy

Am 25.09.2015 um 00:53 schrieb Lee, Tommy:
> Hi,
> Yesterday I used one of four Marvell's DTB files with my 4.0.4 system zImage built with mvebu_v7_defconfig. The boot process automatically enabled only eth0.
> 
> Unfortunately I do not have the DTS file for building that DTB file. I am reviewing the relevant DTS files, in the 2015.05 and Marvell's 2012.11 file systems, to try to resolve the eth1 enabling issue now.

dtc, the device tree compiler, can decompile dtb to dts. If memory
serves right, you can use something along

dtc -I DTB -O DTS yourfile.dtb

With kind regards

Stefan Peter
