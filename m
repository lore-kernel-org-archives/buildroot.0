From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Aug 2009 09:45:12 +0200
Subject: [Buildroot] CramFS + SquashFS
In-Reply-To: <26fbce020908251102n22cca9f7kd007d83da0cde199@mail.gmail.com>
	(Luciano Greiner's message of "Tue\,
	25 Aug 2009 15\:02\:47 -0300")
References: <26fbce020908240822l7ef7d181mafdb04f577651bb6@mail.gmail.com>
	<87ws4tndwg.fsf@macbook.be.48ers.dk>
	<26fbce020908251102n22cca9f7kd007d83da0cde199@mail.gmail.com>
Message-ID: <87k50rm31z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:

 Luciano> Hello Peter.
 Luciano>   Thanks for your answer. I think it's better to compile kernel and
 Luciano> create filesystems out of BR too.
 Luciano> Is there any way to easily export BR cross env variables to my own
 Luciano> command line shell to make it?

What exactly do you mean? Normally it's just a matter of adding
build_*/staging_dir/usr/bin to your path.

See http://buildroot.net/buildroot.html#using_toolchain for more
details.

-- 
Bye, Peter Korsgaard
