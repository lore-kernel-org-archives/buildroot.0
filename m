From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Dec 2012 14:50:02 -0800
Subject: [Buildroot] [PATCH 8/8] screen: add license information
In-Reply-To: <50BE723A.3040102@mind.be> (Arnout Vandecappelle's message of
 "Tue, 04 Dec 2012 22:59:22 +0100")
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
 <1354270483-32356-9-git-send-email-spdawson@gmail.com>
 <50BE723A.3040102@mind.be>
Message-ID: <87d2ypl9et.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 30/11/12 11:14, spdawson at gmail.com wrote:
 >> From: Simon Dawson<spdawson@gmail.com>
 >> 
 >> Signed-off-by: Simon Dawson<spdawson@gmail.com>
 >> ---
 >> package/screen/screen.mk |    2 ++
 >> 1 file changed, 2 insertions(+)
 >> 
 >> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
 >> index 8786322..50bb1a6 100644
 >> --- a/package/screen/screen.mk
 >> +++ b/package/screen/screen.mk
 >> @@ -6,6 +6,8 @@
 >> 
 >> SCREEN_VERSION = 4.0.3
 >> SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 >> +SCREEN_LICENSE = GPLv2

 Arnout>  GPLv2+, actually.

Committed as GPLv2+, thanks.

-- 
Bye, Peter Korsgaard
