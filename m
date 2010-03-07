From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Mar 2010 23:04:58 +0100
Subject: [Buildroot] Error in 'e2fsprogs 1.41.9 Post installing'
In-Reply-To: <1267856360.13606.11.camel@bernd-desktop> (Thomas's message of
	"Sat, 06 Mar 2010 07:19:20 +0100")
References: <1267856360.13606.11.camel@bernd-desktop>
Message-ID: <87ocizzt2t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas  <tokant@gmx.net> writes:

 Thomas> Hello,
 Thomas> I tried the latest buildroot-2010.02:
 Thomas> make at91rm9200df_defconfig
 Thomas> make menuconfig
 Thomas> make

 Thomas> buildroot terminates with:

 Thomas> make: ***
 Thomas> [/media/disk/br1002/buildroot-2010.02/output/build/e2fsprogs-1.41.9/.stamp_hook_post_install] Error 1

Fixed in git. The reason why it fails is that the e2fsprogs package is
selected, but no e2fsprogs binaries/libraries are enabled.

-- 
Bye, Peter Korsgaard
