From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:50:04 +0100
Subject: [Buildroot] [PATCHv3 12/74] proftpd: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:00 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d283doqb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Also use a complete destination path for the $(INSTALL) command.
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the -D option added as noted by Yann, thanks.

-- 
Bye, Peter Korsgaard
