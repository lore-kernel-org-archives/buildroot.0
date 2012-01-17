From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jan 2012 15:15:57 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <201201171457.13088.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 17 Jan 2012 14:57:12 +0100")
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <201201161845.51186.arnout@mind.be>
 <8739bfcusn.fsf@macbook.be.48ers.dk>
 <201201171457.13088.arnout@mind.be>
Message-ID: <87ty3upg82.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> That option should set
 Arnout> KMOD_INSTALL_STAGING = NO
 >> 
 >> Why would you not install into staging?

 Arnout>  That should me KMOD_INSTALL_TARGET, of course.

You would still need to install the shared library, so we should rather
remove the binary instead.

-- 
Bye, Peter Korsgaard
