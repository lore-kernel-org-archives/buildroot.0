From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 27 Mar 2014 17:19:35 +0100
Subject: [Buildroot] [RFC] add ability to pass additional users tables
Message-ID: <1395937176-7585-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I wanted to add some predefined users on my target system, but did not want to
set up a skeleton. So I added a new entry into the "System configuration"
menu, to set the location of an additional users table, to be passed to the
powerful mkusers script, as it is done for the device tables.

This is an RFC, as I do not know where to add the help instructions in the
manual about this feature.

Best regards,
ELB

Eric Le Bihan (1):
  system: add ability to pass additional users tables.

 fs/common.mk     |    6 +++++-
 system/Config.in |    9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

--
1.7.9.5
