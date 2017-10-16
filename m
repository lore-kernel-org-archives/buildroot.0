From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 00:02:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix wrong symlink for
	systemd service
In-Reply-To: <1505902234-4876-1-git-send-email-brain@jikos.cz> (Petr Kulhavy's
 message of "Wed, 20 Sep 2017 12:10:34 +0200")
References: <1505902234-4876-1-git-send-email-brain@jikos.cz>
Message-ID: <87efq2oio0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Kulhavy <brain@jikos.cz> writes:

 > The symlink to /etc/systemd/system/syslog.service was pointing 4 levels up
 > to /usr/lib instead of 3 levels up.

 > This wasn't an issue on the actual system (/../ equals to / ) but was causing a
 > deadlink in the TARGET directory.

 > Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
