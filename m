From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Feb 2010 12:12:53 +0100
Subject: [Buildroot] -sh: lrzsz: not found
In-Reply-To: <19bf.4b79c31a.526aa@getafix.xdna.net> (Cameron Hutchison's
	message of "Mon, 15 Feb 2010 21:56:42 -0000")
References: <SNT129-W3519623AE8254A748FDB73B94A0@phx.gbl>
	<19bf.4b79c31a.526aa@getafix.xdna.net>
Message-ID: <87hbpg2k0a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cameron" == Cameron Hutchison <lists@xdna.net> writes:

 Cameron> Tony Mozi <spooflinux@hotmail.fr> writes:
 >> I copy the new image rootfs in the board.
 >> The directory lrzsz is present in buildroot-2009.11/package/lrzsz.

 >> However, in serial console : 
 >> # lrzsz
 >> -sh: lrzsz: not found

 Cameron> It appears to be installed as /usr/bin/sz and /usr/bin/rz.

Yes, just like upstream does.

It's the same on my Debian machin:

dpkg -L lrzsz|grep bin
/usr/bin
/usr/bin/rx
/usr/bin/rz
/usr/bin/sz
/usr/bin/sx
/usr/bin/rb
/usr/bin/sb

-- 
Bye, Peter Korsgaard
