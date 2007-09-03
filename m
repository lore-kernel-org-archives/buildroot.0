From: Rouslan Solomakhin <rouslan@solomakhin.net>
Date: Sun, 2 Sep 2007 20:39:39 -0500 (CDT)
Subject: [Buildroot] Patch for gcc makefile
In-Reply-To: <20070902195125.GT11697@aon.at>
References: <45513.24.207.255.59.1188756844.squirrel@box240.bluehost.com>
	<20070902195125.GT11697@aon.at>
Message-ID: <37492.24.207.255.59.1188783579.squirrel@box240.bluehost.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sun, Sep 02, 2007 at 01:14:04PM -0500, Rouslan Solomakhin wrote:
> I find this a little bit odd. What gccbug scripts do you have?
> $ find build_*/staging_dir/ -iname "*gccbug*"
> build_i386/staging_dir/bin/i386-linux-gccbug
> build_i386/staging_dir/bin/i386-linux-uclibc-gccbug
> $
>

Here is what I have:

$ find build_i686/staging_dir/ -name "*gccbug*"
build_i686/staging_dir/bin/i686-linux-gccbug
$

Rouslan
