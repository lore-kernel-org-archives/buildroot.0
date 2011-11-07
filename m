From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 7 Nov 2011 16:07:35 +0100
Subject: [Buildroot] Future...TOOLCHAIN builds..
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

While following the discussions on the buildroot mailing list, I saw
that for the next releases the CROSSTOOL-NG toolchain will be used as
default, so a started to experiment with the CROSSTOOL-NG buildroot
toolchain (this morning).

Until now.. U used the buildroot to generate a 'cross-toolchain', even
'worse'; I used buildroot to generate 2 toolchains. 
	A) One running on LINUX 
	B) One running on top of CYGWIN (for the less Linux-minded
colleagues)

Which was quite easy to do... until now. 

1) Will this also be possible for the CROSSTOOL-NG toolchain that is
build with buildroot?
2) Another question that pops-up when building a CROSSTOOL-NG toolchain,
is that I'm not able to select a toolchain with ARM-VECTOR-floating
point support is this correct? 



Kind regards,
Noel.


NOTE: Of the record, the buildroot-CYGWIN-toolchain build was working
until some weeks ago (for me), in the current git-tree this is not
working anymore ( build troubles into mpc/mpfr and gmp), without looking
to much in detail (I think) it has to do with  'another' way of naming
libs 'libxxxxx' on Linux vs 'cygxxxxxxx' on cygwin!


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111107/afdaf45f/attachment.html>
