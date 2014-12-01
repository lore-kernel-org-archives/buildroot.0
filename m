From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:02:06 +0100
Subject: [Buildroot] [PATCHv3 23/74] tftpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-24-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:11 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-24-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wq6bav1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Also make sure we use a full path for the destination of the
 > $(INSTALL) command.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the mode added as noted by Yann, thanks.

-- 
Bye, Peter Korsgaard
