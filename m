From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:59:52 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/ola: fix autoreconf
	issue for host-ola"
In-Reply-To: <1431637036-8089-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 14 May 2015 22:57:16 +0200")
References: <1431637036-8089-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431637036-8089-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87pp62datz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This reverts commit 884af65fd5ddc548f19a26162f905a32ef0b53b3. Thanks
 > to the change of the installation path of host-autoconf-archive
 > macros, host-ola will no longer see them when doing its autoreconf, so
 > the patch that was added by the commit being reverted here is no
 > longer needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
