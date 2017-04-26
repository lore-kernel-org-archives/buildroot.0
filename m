From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:12:00 +0200
Subject: [Buildroot] [PATCH] imagemagick: add upstream security fix for
	CVE-2017-7606
In-Reply-To: <20170425153554.27006-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Apr 2017 17:35:54 +0200")
References: <20170425153554.27006-1-peter@korsgaard.com>
Message-ID: <87d1bzod6n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This is not yet part of any release.
 > coders/rle.c in ImageMagick 7.0.5-4 has an "outside the range of
 > representable values of type unsigned char" undefined behavior issue, which
 > might allow remote attackers to cause a denial of service (application
 > crash) or possibly have unspecified other impact via a crafted image.

 > For more details, see:
 > https://blogs.gentoo.org/ago/2017/04/02/imagemagick-undefined-behavior-in-codersrle-c/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
