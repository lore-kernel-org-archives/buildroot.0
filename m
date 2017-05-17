From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:44:07 +0200
Subject: [Buildroot] [PATCH v3] package/pulseview: fix a build issue
In-Reply-To: <1495015800-30480-1-git-send-email-brgl@bgdev.pl> (Bartosz
 Golaszewski's message of "Wed, 17 May 2017 12:10:00 +0200")
References: <1495015800-30480-1-git-send-email-brgl@bgdev.pl>
Message-ID: <87d1b743jc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <brgl@bgdev.pl> writes:

 > Backport an upstream patch fixing the build issue related to boost
 > math definitions.

 > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 > ---
 > v1 -> v2:
 > - backported the upstream patch instead of fixing it myself

 > v2 -> v3:
 > - dropped the patch numbering
 > - added the missing sign-off

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
