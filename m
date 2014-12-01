From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:46:48 +0100
Subject: [Buildroot] [PATCHv3 10/74] stunnel: use the
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:17:58 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lhmrdovr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since the existing STUNNEL_INSTALL_CONF_SCRIPT hook no longer installs
 > the init script, we rename it to STUNNEL_INSTALL_CONF.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
