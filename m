From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 01:29:32 +0100
Subject: [Buildroot] [PATCH v3 1/5] system: move init system option
	above /dev management.
In-Reply-To: <1383752078-25315-2-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Wed, 6 Nov 2013 16:34:34 +0100")
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87li0v93wz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

> The option to choose init system was below the one for /dev
> management.  As Systemd forces the use of udev, it is logical to swap
> them.

Committed with some minor fixups to get it to apply, thanks.

-- 
Bye, Peter Korsgaard
