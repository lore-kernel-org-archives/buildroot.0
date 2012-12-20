From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Dec 2012 10:08:51 +0100
Subject: [Buildroot] [PATCH RFC 5/6] libfslcodec: new package
In-Reply-To: <50D2CA07.1060503@mind.be> (Arnout Vandecappelle's message of
 "Thu, 20 Dec 2012 09:19:19 +0100")
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-6-git-send-email-arnout@mind.be>
 <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
 <50D2CA07.1060503@mind.be>
Message-ID: <87a9t9ytss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> For packages like this one that install pre-built libraries, it
 >> would be good to document somewhere or to auto-check (e.g. with
 >> toolchain kconfig options vs.  package kconfig options) the ABI
 >> compatibility to make sure that there won't be any issue with the
 >> toolchain used.

 Arnout>  I agree, but how?

I don't know the specifics of this package, but presumably it only works
with glibc and a specific soft/softfp/hard floating point mode? If so,
we could atleast catch some of these dependencies in Config.in.

-- 
Bye, Peter Korsgaard
