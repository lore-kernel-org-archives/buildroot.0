From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:53:57 +0100
Subject: [Buildroot] [PATCHv3 16/74] nfs-utils: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-17-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:04 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vblvc9ze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Also move back the NFS_UTILS_INSTALL_FIXUP hook registration right
 > after the hook definition.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the -D option added as noted by Yann, thanks.

-- 
Bye, Peter Korsgaard
