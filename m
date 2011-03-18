From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2011 17:01:22 +0100
Subject: [Buildroot] Buildroot in use
In-Reply-To: <4D82421C.9020704@gmail.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
	<1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
	<4D82421C.9020704@gmail.com>
Message-ID: <20110318170122.6efde358@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Mar 2011 10:17:16 -0700
Steve Calfee <stevecalfee@gmail.com> wrote:

> I believe that the gcc that you have built has a few built-in paths,
> so you cannot just move the compiler stuff to another file tree.

As long as the sysroot remains at the same relative location compared
to the compiler, you're fine with a toolchain based on gcc 4.x : you
can move it around if you wish. If think Yann E. Morin could give a few
more details here.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
