From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Sep 2008 11:53:50 +0200
Subject: [Buildroot] undefined macro: AM_PROG_LIBTOOL (buildroot failure)
In-Reply-To: <6306c640809250352j54395362u4ee59f7d28fbc5f5@mail.gmail.com> (Ram
	kumar's message of "Thu\, 25 Sep 2008 16\:22\:25 +0530")
References: <6306c640805281409v1bf5384ag2c1353fd4aead298@mail.gmail.com>
	<87k5gtyb0x.fsf@macbook.be.48ers.dk>
	<6306c640809250352j54395362u4ee59f7d28fbc5f5@mail.gmail.com>
Message-ID: <871vz3s2fl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ram" == Ram kumar <ramkumar.research@gmail.com> writes:

Hi,

 >> libusb missed a dependency on host-libtool and patch version bumped.
 >> Fixed in r22311-r22313.

 Ram> can you just tell me....how to download the patch and apply it ?????

You can either do a svn checkout or download the nightly tarball (any
version since June 14th should be ok.

If you only want those particular commits you can take then with svn
diff - No guarantees that they apply cleanly or do the right things on
other versions ofcause.

-- 
Bye, Peter Korsgaard
