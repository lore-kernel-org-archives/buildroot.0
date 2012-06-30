From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jun 2012 10:55:59 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
	configured to do so
In-Reply-To: <87txxt42up.fsf@macbook.be.48ers.dk>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
 <87txxt42up.fsf@macbook.be.48ers.dk>
Message-ID: <20120630105559.7e57508a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 30 Jun 2012 10:32:14 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> I am not fully sure I like this. Do we want to have the same
>  Thomas> stuff in all packages, or should we think about doing this
>  Thomas> globally in some way?
> 
> Agree, I've added it globally now.

Yes, seen that, great. Does this addition of -static to TARGET_LDFLAGS
play well with --enable-static for AUTOTARGETS packages?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
