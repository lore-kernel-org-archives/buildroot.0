From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Apr 2010 21:42:06 +0200
Subject: [Buildroot] [PATCH 04/16] correct name of xapp_xinput.mk
In-Reply-To: <1270126006-22405-4-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Thu, 1 Apr 2010 13:46:34 +0100")
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
	<1270126006-22405-4-git-send-email-will_wagner@carallon.com>
Message-ID: <87aatdoho1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> ---
 Will>  package/x11r7/xapp_xinput/xapp_xbacklight.mk |   13 -------------
 Will>  package/x11r7/xapp_xinput/xapp_xinput.mk     |   13 +++++++++++++

Committed, thanks - Please use -M option to git format-patch (and -s) so
git will show it's a pure rename. That makes review easier.

-- 
Bye, Peter Korsgaard
