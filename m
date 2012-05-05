From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 11:05:03 +0200
Subject: [Buildroot] [PATCH resend] directfb: add support for davinci
	gfx driver
In-Reply-To: <1335631844-15681-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 28 Apr 2012 18:50:44 +0200")
References: <1335631844-15681-1-git-send-email-arnout@mind.be>
Message-ID: <87obq3f16o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout>  package/directfb/Config.in   |    4 ++++
 Arnout>  package/directfb/directfb.mk |    3 ++-
 Arnout>  2 files changed, 6 insertions(+), 1 deletion(-)

This seems to fail on the autobuilder:

http://autobuild.buildroot.org/results/d5c2cb226757a8bf90dac33bd04f87f325654220/build-end.log

For some odd reason, I don't see the davincifb.h file in the directfb
tarball, but it IS in git:

http://git.directfb.org/?p=core/DirectFB.git;a=tree;f=gfxdrivers/davinci;h=f0bd9ad6add6164f3a5e953d4eed4056315a2be2;hb=ab0d779e85cec22c7c2e7b8b6b1976049b1ba0f1

Is it working for you? If so, how?

-- 
Bye, Peter Korsgaard
