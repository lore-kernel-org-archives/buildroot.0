From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:11:19 +0200
Subject: [Buildroot] [PATCH 1/2] libcroco: add upstream security fixes
In-Reply-To: <20170425141700.30077-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Apr 2017 16:16:59 +0200")
References: <20170425141700.30077-1-peter@korsgaard.com>
Message-ID: <87lgqnod7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > These have been added to upstream git after 0.6.12 was released.
 > CVE-2017-7960 - The cr_input_new_from_uri function in cr-input.c in libcroco
 > 0.6.11 and 0.6.12 allows remote attackers to cause a denial of service
 > (heap-based buffer over-read) via a crafted CSS file.

 > CVE-2017-7961 - The cr_tknzr_parse_rgb function in cr-tknzr.c in libcroco
 > 0.6.11 and 0.6.12 has an "outside the range of representable values of type
 > long" undefined behavior issue, which might allow remote attackers to cause
 > a denial of service (application crash) or possibly have unspecified other
 > impact via a crafted CSS file.

 > For more details, see:
 > https://blogs.gentoo.org/ago/2017/04/17/libcroco-heap-overflow-and-undefined-behavior/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
