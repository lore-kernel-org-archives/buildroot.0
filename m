From: J. Spence <j3mail-busybox@rearden.com>
Date: Thu, 13 Mar 2008 10:31:53 -0700 (PDT)
Subject: [Buildroot] continuous integration testing
Message-ID: <20597005.396401205429513354.JavaMail.root@zmail.rearden.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After troubleshooting a few more things with trunk, I'm beginning to think that I need to set up some kind of continuous integration platform so that any other mistakes in checkins trigger a notification.  

Does anyone have anything like this already, even in a broken state?  I'd rather repair a few squeaky wheels than build the whole cart myself.

This raises a few issues:

* CI notifications could be kind of annoying if they're all sent to the list.

* This will probably include cross-platform regressions as well, which could also be kind of annoying (imagine getting notifications about build problems on totally wacky configurations, like uclibc for itanium).
