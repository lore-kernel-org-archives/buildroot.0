From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:58:48 +0100
Subject: [Buildroot] [PATCH] macchanger: add license file
In-Reply-To: <1448455534-766-1-git-send-email-peda@lysator.liu.se> (Peter
 Rosin's message of "Wed, 25 Nov 2015 13:45:34 +0100")
References: <1448455534-766-1-git-send-email-peda@lysator.liu.se>
Message-ID: <87vb8pyc4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Rosin <peda@lysator.liu.se> writes:

 > From: Peter Rosin <peda@axentia.se>
 > Signed-off-by: Peter Rosin <peda@axentia.se>
 > ---
 >  package/macchanger/macchanger.mk |    1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
 > index 5ded0b8..a74337a 100644
 > --- a/package/macchanger/macchanger.mk
 > +++ b/package/macchanger/macchanger.mk
 > @@ -7,5 +7,6 @@
 >  MACCHANGER_VERSION = 1.6.0
 >  MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
 >  MACCHANGER_LICENSE = GPLv2+
 > +MACCHANGER_LICENSE_FILES = src/mac.h

When we use a source code file as the license file we typically use the
"main" .c file, which in this case would be src/main.c, so I've changed
it to that and committed, thanks.

-- 
Bye, Peter Korsgaard
