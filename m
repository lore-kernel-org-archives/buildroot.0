From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Oct 2017 00:05:03 +0200
Subject: [Buildroot] [PATCH 1/4] fs/common.mk: support lz4 compression
In-Reply-To: <20171013191655.30427-1-peter@korsgaard.com>
References: <20171013191655.30427-1-peter@korsgaard.com>
Message-ID: <20171014000503.615d7fa6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 21:16:52 +0200, Peter Korsgaard wrote:
> Similar to the other compressors.  Notice that we use the -l (legacy format)
> for Linux kernel initrd compatibility.
> 
> Lz4 decompression is supported by the Linux kernel since 3.11.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I don't know in which direction we want to go, but Yann has a series
doing cleanups/improvements in the filesystem stuff, and as part of
this, he is dropping the compression options:

  https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/fs-2

(This has not been submitted so far I believe.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
