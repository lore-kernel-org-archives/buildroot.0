From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 19 Sep 2010 03:32:10 +0200
Subject: [Buildroot] [PATCH 3/3] gettext: bump to 0.18.1.1
In-Reply-To: <1284813490-32442-4-git-send-email-llandwerlin@gmail.com>
References: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
	<1284813490-32442-4-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284859930.12897.544.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm sorry, but this patch does not seem to work well in all situations.
I'm having problems with "dumb" configuration where we select libglib
which requires libintl to work, but we don't have a toolchain with
locales...

I will resend a patch without this problem.

Regards,

-- 
Lionel Landwerlin
