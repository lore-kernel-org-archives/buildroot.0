From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 00:01:39 +0200
Subject: [Buildroot] [PATCH 09/13] makedevs: add license information
In-Reply-To: <1404304811-27480-9-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:40:07 -0300")
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
 <1404304811-27480-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx6rv7b0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/makedevs/makedevs.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
 > index 7210dc6..6ca688c 100644
 > --- a/package/makedevs/makedevs.mk
 > +++ b/package/makedevs/makedevs.mk
 > @@ -9,6 +9,7 @@ MAKEDEVS_SOURCE =
 >  HOST_MAKEDEVS_SOURCE =
 
 >  MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 > +MAKEDEVS_LICENSE = LGPLv2

Why? It has a GPLv2 header and is part of Buildroot, so it should be
GPLv2. It doesn't really matter though as the legal-info doesn't do
anything when the packages doesn't have a _SOURCE.

-- 
Bye, Peter Korsgaard
