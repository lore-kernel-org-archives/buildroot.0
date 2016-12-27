From: daggs <daggs@gmx.com>
Date: Tue, 27 Dec 2016 19:43:09 +0100
Subject: [Buildroot] ntp enabled, date stays default.
Message-ID: <trinity-200ef629-1fe8-452a-a0fb-a50b39ea7d03-1482864189272@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've created a image with ntp and ntpdate, when I boot the system, I see ntp is up but the date is still the default one.
e.g. "Thu Jan  1 00:05:35 UTC 1970".
when I try to run ntpdate I get this:
# ntpdate
 1 Jan 00:13:05 ntpdate[233]: no servers can be used, exiting
pinging the addrs in the ntp.conf works.

any ideas what I'm doing wrong?

Thanks.
