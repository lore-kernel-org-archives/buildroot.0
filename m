From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Apr 2011 07:28:21 +0200
Subject: [Buildroot] devmem2
In-Reply-To: <BANLkTinUVfnoMGL2jySY4h7XOpN=Gkc2dA@mail.gmail.com> (Xianghua
	Xiao's message of "Tue, 26 Apr 2011 22:55:16 -0500")
References: <1303869098.2489.67.camel@kenm-i7>
	<129278.98526.qm@web161414.mail.bf1.yahoo.com>
	<BANLkTinUVfnoMGL2jySY4h7XOpN=Gkc2dA@mail.gmail.com>
Message-ID: <87tydkz2iy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Xianghua" == Xianghua Xiao <xiaoxianghua@gmail.com> writes:

 Xianghua> why not keep devmem2 as an option but disable it by default,
 Xianghua> it's tiny anyway and essential for embedded devel.

That's how it is today - Busybox devmem applet is enabled in the default
busybox config, and we have a devmem2 package that is only visible when
you enable BR2_DEPRECATED.

-- 
Bye, Peter Korsgaard
