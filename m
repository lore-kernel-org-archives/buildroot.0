From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 22:58:59 +0100
Subject: [Buildroot] [PATCH] package/sysklogd: fix installation path of
 the daemons
In-Reply-To: <20200315022706.20107-1-unixmania@gmail.com> (unixmania's message
 of "Sat, 14 Mar 2020 23:27:06 -0300")
References: <20200315022706.20107-1-unixmania@gmail.com>
Message-ID: <87zhc92wv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Use "--exec-prefix=/" to install syslogd and klogd at /sbin, as required
 > by the init scripts. This also ensures that the BusyBox counterparts are
 > not installed.

 > Update the systemd unit files, accordingly.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > CC: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
