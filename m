From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Mon, 26 Nov 2018 10:38:50 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
	to libltdl	only
In-Reply-To: <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
 <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
Message-ID: <1543225130.5778.5.camel@Nokia-N900>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon Nov 26 10:28:29 2018 Arnout Vandecappelle <arnout@mind.be> wrote:
> > > +HOST_LIBTOOL_SUBDIR = .
> 
>?  I guess the following doesn't work?
> 
> HOST_LIBTOOL_SUBDIR =

But "." works (as it was working for glibc and gdb previously)...

>?  Ideally, the GPL-2.0+ part should also mention to what it applies. Like
> 
> HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPLv2.1 (libltdl)
> 
> (because I think libtool is the only thing that gets installed in
> HOST_DIR, isn't it?)

Last time I've checked libltdl was installed in HOST_DIR (I cannot tell if it's used or not right now).

--
Alex.
