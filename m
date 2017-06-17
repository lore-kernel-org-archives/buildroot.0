From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Jun 2017 10:48:40 +0200
Subject: [Buildroot] [PATCH 2/2] openblocks_a6_defconfig: improve/fix
	configuration
In-Reply-To: <20170616144144.30280-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Jun 2017 16:41:44 +0200")
References: <20170616144144.30280-1-peter@korsgaard.com>
 <20170616144144.30280-2-peter@korsgaard.com>
Message-ID: <87o9tngftj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The board has an ethernet interface, so enable DHCP for it.

> The used flash chip uses 16K erase blocks, so use that for JFFS2:

 > mtdinfo -a
 > ..
 > mtd5
 > Name:                           user
 > Type:                           nand
 > Eraseblock size:                16384 bytes, 16.0 KiB
 > Amount of eraseblocks:          1915 (31375360 bytes, 29.9 MiB)
 > Minimum input/output unit size: 512 bytes
 > Sub-page size:                  256 bytes
 > OOB size:                       16 bytes
 > Character device major/minor:   90:10
 > Bad blocks are allowed:         true
 > Device is writable:             true

 > While we're at it, add a readme explaining how to build and upload the build
 > to the board.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
