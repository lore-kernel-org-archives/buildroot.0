From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 20:29:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: replace local
 syslog.conf sample with upstream
In-Reply-To: <20210201125236.451176-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Mon, 1 Feb 2021 13:52:36 +0100")
References: <20210201125236.451176-1-troglobit@gmail.com>
Message-ID: <87pn1faayb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > This patch drops the local syslog.conf in favor of the one shipped with
 > sysklogd.  The upstream syslog.conf sample differs from the Buildroot
 > one primarily in shifting to /var/log/syslog as the default for log
 > messages.  It also comes with a dedicated /var/log/kern.log and some
 > commented-out filtering examples.

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
