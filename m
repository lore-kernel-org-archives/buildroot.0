From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 14:47:28 +0100
Subject: [Buildroot] [PATCH 2019.02.x] package/sysklogd: fix daemon
 paths in systemd unit files
In-Reply-To: <20200315022732.20198-1-unixmania@gmail.com> (unixmania's message
 of "Sat, 14 Mar 2020 23:27:32 -0300")
References: <20200315022732.20198-1-unixmania@gmail.com>
Message-ID: <87y2s1ivbj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > They are at /sbin, not /usr/sbin.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > CC: Peter Korsgaard <peter@korsgaard.com>

 > Peter, this applies to 2019.02.x.

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
