From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:55:10 +0100
Subject: [Buildroot] [git commit master 1/1] cdrkit: fix build with
	ccache
In-Reply-To: <87tygyth2v.fsf@macbook.be.48ers.dk>
References: <20110120202551.3757C8B537@busybox.osuosl.org>
	<20110124170817.628499e6@surf> <87tygyth2v.fsf@macbook.be.48ers.dk>
Message-ID: <20110124175510.086c9719@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Jan 2011 17:14:00 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  >> Cmake gets confused about ccache, so don't use ccache for cmake builds.
> 
>  Thomas> Which problems did you had exactly ?
> 
> See the quoted error message in the libcuefile thread:
> 
> http://lists.busybox.net/pipermail/buildroot/2011-January/040755.html
> 
> (and followups)

Thanks. In fact, I found this e-mail while going through the rest of my
Buildroot backlog (which I'm going through in a reverse chronological
order).

>  Thomas> While this is obviously the right short-term fix, it's a bit of
>  Thomas> a shame of CMake doesn't play well with ccache, so maybe it's
>  Thomas> something I could raise on the CMake mailing-list.
> 
> Indeed. We left it here for you to have fun with once you're back from
> holidays :P

Thanks so much :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
