From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 13 Jun 2012 18:01:47 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: backport hotplug
	support
In-Reply-To: <20120613182859.3217c88c@skate>
References: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
 <20120613182859.3217c88c@skate>
Message-ID: <4FD8C77B.6050600@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/06/2012 17:28, Thomas Petazzoni wrote:
>
> Unless I'm wrong X11R7.7 has been released some time ago, and it
> includes X server 1.12, at
> http://www.x.org/releases/X11R7.7/src/xserver/. So why would we bother
> backporting 1.8 material to a 1.7 version? Upgrading the complete X.org
> stack to X11R7.7 seems like a much more appropriate solution. Or maybe
> I'm missing something obvious?
>

I have largely finished ported over to 7.7 and hopefully will send some 
patches soon. I actually did the work a few months before the release so 
I need to go back and check package versions and also I have not tested 
that many packages yet.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
