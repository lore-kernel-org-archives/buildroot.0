From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:36:02 +0100
Subject: [Buildroot] [PATCHv3 04/74] radvd: use <pkg>_INSTALL_INIT_SYSV
In-Reply-To: <1417357142-14307-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:17:52 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnnnf3y5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit changes the radvd to use the <pkg>_INSTALL_INIT_SYSV
 > mechanism instead of using a post install target hook. We also use a
 > full destination path when calling $(INSTALL).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
