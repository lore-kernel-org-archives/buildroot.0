From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Apr 2010 12:19:09 +0200
Subject: [Buildroot] [PATCH 4/7] Remove XEvIE (app & proto) as removed
	from X11R7.5
In-Reply-To: <1271264806-23336-5-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Wed, 14 Apr 2010 18:06:43 +0100")
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-5-git-send-email-will_wagner@carallon.com>
Message-ID: <877hnz7psy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>

Committed - Again you forgot to remove the select from the xserver
Config.in

-- 
Bye, Peter Korsgaard
