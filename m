From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Dec 2012 14:44:39 -0800
Subject: [Buildroot] [PATCH 7/8] oprofile: add license information
In-Reply-To: <50BE7139.4000405@mind.be> (Arnout Vandecappelle's message of
 "Tue, 04 Dec 2012 22:55:05 +0100")
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
 <1354270483-32356-8-git-send-email-spdawson@gmail.com>
 <50BE7139.4000405@mind.be>
Message-ID: <87hao1l9ns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 30/11/12 11:14, spdawson at gmail.com wrote:
 >> From: Simon Dawson<simond@trainfx.com>
 >> 
 >> Signed-off-by: Simon Dawson<simond@trainfx.com>
 >> ---
 >> package/oprofile/oprofile.mk |    2 ++
 >> 1 file changed, 2 insertions(+)
 >> 
 >> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
 >> index 54c46dd..17d225a 100644
 >> --- a/package/oprofile/oprofile.mk
 >> +++ b/package/oprofile/oprofile.mk
 >> @@ -6,6 +6,8 @@
 >> 
 >> OPROFILE_VERSION = 0.9.7
 >> OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 >> +OPROFILE_LICENSE = GPLv2

 Arnout>  Only a few files specify the license, but the ones that do specify
 Arnout> "or later" - including the man page. So it should be GPLv2+.

 Arnout>  (libjvmti, libjvmpi and libopagent libraries are LGPLv2.1+,
 Arnout> for which no license file is included. However, since we don't
 Arnout> install to staging, this is probably not relevant.)

Committed as GPLv2+, thanks.

-- 
Bye, Peter Korsgaard
