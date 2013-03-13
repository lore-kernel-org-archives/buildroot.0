From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Mar 2013 23:13:13 +0100
Subject: [Buildroot] [PATCH] fs/common.mk: Strip extra whitespace when
	device table is empty
In-Reply-To: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
 (Ezequiel Garcia's message of "Wed, 13 Mar 2013 09:28:16 -0300")
References: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <87k3pbq77q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

 Ezequiel> Since ROOTFS_DEVICE_TABLES it is a concatenation of two strings
 Ezequiel> separated by spaces, there will always be a space on it, which means
 Ezequiel> it's never empty. Therefore, when testing for empty, the condition
 Ezequiel> never evaluate to false.

 Ezequiel> The following change fixes this problem; it runs the qstrip on
 Ezequiel> the overall combination of the variables, causing the space to be
 Ezequiel> removed if it's the only thing left.

Committed, thanks.
-- 
Bye, Peter Korsgaard
