From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:26:56 +0200
Subject: [Buildroot] [PATCH 17/19] libcurl: bump version to fix build
 issue
In-Reply-To: <87k4odl6rx.fsf@macbook.be.48ers.dk>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<cover.1280440124.git.thomas.petazzoni@free-electrons.com>
	<28ac3c6785961411af29a9d22388697610b55667.1280440124.git.thomas.petazzoni@free-electrons.com>
	<87k4odl6rx.fsf@macbook.be.48ers.dk>
Message-ID: <20100730102656.25755408@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Jul 2010 10:21:06 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> The libcurl-7.19.2-fix-ssl-no-verbose.patch patch is no
>  Thomas> longer needed.
> 
>  Thomas> Since we're patching a m4 file, we must autoreconfigure the
>  Thomas> package.
> 
> This line is no longer valid.

Oops, correct. I've rebased and re-pushed at the same location.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
