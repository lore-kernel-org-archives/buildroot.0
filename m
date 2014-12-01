From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 00:25:34 +0100
Subject: [Buildroot] [PATCHv3 58/74] rsyslog: install init script and
	config file unconditionally
In-Reply-To: <1417357142-14307-59-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:46 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-59-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppc354wh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As discussed, users should use a rootfs overlay or a post-build script
 > instead of a custom skeleton to override files installed by Buildroot,
 > so there is no point in having conditions when installing init scripts
 > or configuration files.

 > Also, we take this opportunity to rename RSYSLOG_INSTALL_CONF_SCRIPT
 > to RSYSLOG_INSTALL_CONF because it is no longer installing an init
 > script.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
