From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Sep 2007 10:43:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <0709041003590.9921@somehost> (Cristian Ionescu-Idbohrn's message
	of "Tue\, 4 Sep 2007 10\:22\:43 +0200 \(CEST\)")
References: <20070903062608.3D391A65E5@busybox.net>
	<20070903140903.GA4518@aon.at>
	<002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
	<60171.24.207.255.59.1188836578.squirrel@box240.bluehost.com>
	<002e01c7ee70$035c31b0$acc3780a@atmel.com>
	<0709041003590.9921@somehost>
Message-ID: <87hcmag6sc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cristian" == Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com> writes:

Hi,

 Cristian> On Mon, 3 Sep 2007, Ulf Samuelsson wrote:
 >> I think it would be better if we had a MAKEALL script
 >> which needs to be run before a patch is accepted.
 >> 
 >> This should at least build a minimal rootfs for x86 and ARM.

 Cristian> Excellent idea.

Alternatively we can setup a buildbot (http://buildbot.net) instance
for buildroot for continous checks.

-- 
Bye, Peter Korsgaard
