From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:22:51 +0100
Subject: [Buildroot] [PATCHv3 35/74] gnupg: don't both removing a man
	page
In-Reply-To: <1417357142-14307-36-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:23 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-36-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uir9fic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The target-finalize target in the main Makefile removes
 > $(TARGET_DIR)/usr/share/man entirely, so there's no point in having
 > some package specific logic to remove man pages.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the typo fixed, thanks.

-- 
Bye, Peter Korsgaard
