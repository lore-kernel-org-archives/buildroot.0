From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 30 Jan 2021 14:52:02 +0100
Subject: [Buildroot] [RFC PATCH 0/1] package/sysklogd: proposal to update
 default syslog.conf
Message-ID: <20210130135203.159451-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone!

I'm posting this as an RFC patch to see what you think about updating
the default syslog.conf for the sysklogd package to match upstream.

The updated file changes the default log file from messages to syslog,
as is common on most modern systems today.  The messages remains but
only for less critical messages.  The update also adds more examples
for how to enable remote logging as well as different new log formats.

Best regards
 /Joachim

Joachim Wiberg (1):
  package/sysklogd: update default syslog.conf to match upstream

 package/sysklogd/syslog.conf | 69 +++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 5 deletions(-)

-- 
2.25.1
