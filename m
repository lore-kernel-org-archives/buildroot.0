From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Sep 2010 22:55:33 +0200
Subject: [Buildroot] [PATCH 01/18] acpid: convert to gentargets and bump
	to 2.0.6
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
	(Martin Banky's message of "Sun, 26 Sep 2010 00:13:52 -0700")
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <87bp7gz2uy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:

 Martin> Also, added acpi_listen to the target. It was being stripped, but not copied.
 Martin> acpi_listen is a simple shell-friendly tool which connects to acpid and listens
 Martin> for events. When an event occurs, acpi_listen will print it on stdout.

 Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>

Committed with minor tweaks, thanks.

-- 
Bye, Peter Korsgaard
