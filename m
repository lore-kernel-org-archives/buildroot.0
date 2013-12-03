From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 09:12:51 +0100
Subject: [Buildroot] [PATCH 5/5] sysklogd: install to /sbin
In-Reply-To: <1385981368-2235-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 07:49:28 -0300")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <1385981368-2235-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eh5upd30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Install syslogd/klogd to /sbin instead of /usr/sbin to really win over
 > busybox and avoid the ugly noise when booting without busybox installed.
 > Also drop uninstall hook and manpage installation.

Committed, thanks.

-- 
Bye, Peter Korsgaard
