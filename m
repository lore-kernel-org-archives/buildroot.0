From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:14:07 +0100
Subject: [Buildroot] [PATCHv3 30/74] ndisc6: remove man page related code
In-Reply-To: <1417357142-14307-31-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:18 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-31-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx1f9fww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The target-finalize target takes care of removing
 > $(TARGET_DIR)/usr/share/man, so there's no point in having package
 > specific code doing this.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
