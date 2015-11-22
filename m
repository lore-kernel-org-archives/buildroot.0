From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:28:37 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: bump version
In-Reply-To: <1448201014-21381-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 22 Nov 2015 15:03:34 +0100")
References: <1448201014-21381-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oael67wa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes build with glibc-2.22.
 > Also fixes hard-to-trigger deadlock in highly threaded case, and fix
 > libraries dependencies.

 > Misc minor improvements in test programs as well.

 > Fixes #8446.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: gamadril.dev at gmail.com
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Note: even though this is a bump, it actually fixes build issues,
 > so should be considered for master, not -next.

Committed, thanks.

-- 
Bye, Peter Korsgaard
