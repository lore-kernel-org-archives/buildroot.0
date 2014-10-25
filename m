From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:34:14 +0200
Subject: [Buildroot] [PATCH] package/aircrack-ng: add dependency on !
 BR2_PREFER_STATIC_LIB
In-Reply-To: <20141025112330.6718e7c5@free-electrons.com>
References: <1414138180-24607-1-git-send-email-jcmvbkbc@gmail.com>
 <20141025112330.6718e7c5@free-electrons.com>
Message-ID: <20141025123414.313d7f1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Oct 2014 11:23:30 +0200, Thomas Petazzoni wrote:

> I'm going to do some testing, but I believe that aircrack-ng can
> continue to build in BR2_PREFER_STATIC_LIB configurations, and that
> those -ldl flags are not necessary.

I've committed what I believe is a better fix for the issue:
http://git.buildroot.net/buildroot/commit/?id=68e8a10f97ffed4525c5a14b74679c682e8cbf61.
Do not hesitate to have a look, and report back if you disagree.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
