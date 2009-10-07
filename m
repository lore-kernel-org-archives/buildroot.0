From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 09:03:42 +0200
Subject: [Buildroot] [PATCH 6/6] remove superfluous OPTIMIZE and DEBUG
	config knobs
In-Reply-To: <20091007064751.GF10261@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 7 Oct 2009 08\:47\:51 +0200")
References: <1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4bf0f4eae22ac9a6b1afa4621ff32b3f43887a85.1254853146.git.rep.dot.nop@gmail.com>
	<871vlg2wn7.fsf@macbook.be.48ers.dk> <20091006184939.GD10261@mx.loc>
	<20091006223558.73d0678f@surf> <20091007064751.GF10261@mx.loc>
Message-ID: <87vdirn0s1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> * Compile with -g and keep the unstripped binary in the staging/
 >> directory

 Bernhard> the staging area should not be stripped anyway (unless a
 Bernhard> package does it behind our back)

Indeed. The debug stuff is for the (unlikely) situation where you want
to run gdb (not gdbserver) on the target.

-- 
Bye, Peter Korsgaard
