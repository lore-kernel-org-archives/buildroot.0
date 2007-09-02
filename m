From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 2 Sep 2007 21:51:26 +0200
Subject: [Buildroot] Patch for gcc makefile
In-Reply-To: <45513.24.207.255.59.1188756844.squirrel@box240.bluehost.com>
References: <45513.24.207.255.59.1188756844.squirrel@box240.bluehost.com>
Message-ID: <20070902195125.GT11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 02, 2007 at 01:14:04PM -0500, Rouslan Solomakhin wrote:
>Hello,
>
>I got the following error using buildroot svn today and yesterday:
>
>
>strip:
>'/home/rouslan/Software/Buildroot/svn-buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gccbug':
>No such file
>make: ***
>[/home/rouslan/Software/Buildroot/svn-buildroot/toolchain_build_i686/gcc-4.2.1-final/.installed]
>Error 1

I find this a little bit odd. What gccbug scripts do you have?
$ find build_*/staging_dir/ -iname "*gccbug*"
build_i386/staging_dir/bin/i386-linux-gccbug
build_i386/staging_dir/bin/i386-linux-uclibc-gccbug
$ 
