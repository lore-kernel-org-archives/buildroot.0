From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:35:06 +0100
Subject: [Buildroot] [PATCHv3 01/74] vsftpd: use <pkg>_INSTALL_INIT_SYSV
	and rename init script
In-Reply-To: <1417357142-14307-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:17:49 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oarnf3zp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit changes the vsftpd package to use the
 > <pkg>_INSTALL_INIT_SYSV mechanism to install its init script, and
 > renames the init script in the Buildroot source tree to match how it's
 > named on the target.

 > Also, the init script is now installed unconditionally, as is done in
 > most packages.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
