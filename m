From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 20:11:31 +0100
Subject: [Buildroot] [PATCH 03/16] libxml2: do not apply libtool patch
 when compiling for host
In-Reply-To: <87k4u5jmq8.fsf@macbook.be.48ers.dk>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<e81149c54301f88ae64bd85caa6d0f29e879d064.1266691382.git.thomas.petazzoni@free-electrons.com>
	<87k4u5jmq8.fsf@macbook.be.48ers.dk>
Message-ID: <20100222201131.48bbd5cb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Feb 2010 16:47:59 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Is there ever any situation where {HOST,}_<PACKAGE>_LIBTOOL_PATCH will
> differ, or should we just use the host build use the normal variable,
> just like we are doing for _SOURCE/_SITE/_VERSION?

I don't think so, so you're right, we should do this. Noted in my TODO
list, but I won't do it for the 2010.02 release.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
