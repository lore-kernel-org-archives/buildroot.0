From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Oct 2009 20:17:58 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD4C1BB.5000304@wp.pl> (W. P.'s message of "Tue\,
	13 Oct 2009 20\:06\:51 +0200")
References: <4AD389B2.20400@wp.pl> <87my3w4bw6.fsf@macbook.be.48ers.dk>
	<4AD3918B.5000908@wp.pl> <20091012203645.GX2266@mx.loc>
	<4AD3B2BE.2010809@wp.pl> <20091013111009.GB23718@mx.loc>
	<4AD4C1BB.5000304@wp.pl>
Message-ID: <877huz2m5l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "W" == W P <laurentp@wp.pl> writes:


 W> Heeelllp. Where may I find buildroot-0.9.28(29)? I mean later than
 W> 0.9.27 and earlier than 2009.09.

I take it you mean 2009.02. There is no such thing, there were no
releases between 0.9.27 in 2005 and 2009.02.

 W> Why am I asking: in buildroot 0.9.27 I have found patches for gcc 3.4.3
 W> and I need 3.4.4 (google at linux-2.6.12.6-venus to see why).
 W> And in 2009.02 earliest version of patches for gcc is 3.4.6. So there is
 W> a "gap" between files available on buildroot download site.

3.4.6 patches most likely apply to 3.4.4.

 W> For binutils i need version 2.15.94 which i may find in 0.9.27.

 W> The rest (if I understand well the build process) is relatively simple:
 W> patching config.in with versions i need?

yes.

Have you tried the oldest versions supported by 2009.02 before you do
all this work? Chances are that they'll work.

-- 
Bye, Peter Korsgaard
