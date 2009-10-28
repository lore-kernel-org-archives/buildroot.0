From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Oct 2009 21:40:10 +0100
Subject: [Buildroot] problems building vlc against git buildroot
In-Reply-To: <c166aa9f0910281000m66ea3ce8x379d9c5afe9003c1@mail.gmail.com>
	(Andrew Dyer's message of "Wed\, 28 Oct 2009 12\:00\:29 -0500")
References: <c166aa9f0910281000m66ea3ce8x379d9c5afe9003c1@mail.gmail.com>
Message-ID: <87tyxjb6c5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Dyer <amdyer@gmail.com> writes:

Hi,

 Andrew> but the VLC configure is not picking up that libiconv is available.

 Andrew> the attached build log was captured after I did the following:
 Andrew> Patched the vlc config.in as above, rm'd the entire output directory,
 Andrew> did a make and vlc build errored, verified that libiconv was in the
 Andrew> target filesystem, and then did 'make 2>&1 | tee make.log'

Have a look at output/build/vlc-0.8.6e/config.log and the corresponding
lines of configure to see how it tests for iconv and why it fails.

-- 
Bye, Peter Korsgaard
