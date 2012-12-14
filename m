From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 01:05:20 +0100
Subject: [Buildroot] [PATCH] qt: fix qconfig configure parameter
In-Reply-To: <1336425264-29060-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Mon, 7 May 2012 17:14:24 -0400")
References: <1336425264-29060-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87ehitjy67.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 Frank> The Qt configure option for specifying a custom qconfig.h
 Frank> file changed from -config to -qconfig. This makes the
 Frank> corresponding change in qt.mk.

Committed, thanks - And sorry for the slow response.

-- 
Bye, Peter Korsgaard
