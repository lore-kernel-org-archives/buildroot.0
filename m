From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Aug 2013 08:41:14 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with
	threads support
In-Reply-To: <CAHXCMM+4H-G4wpwG=uKN-76HcDu0aDEx6hQUhh-BjE+TC86OYw@mail.gmail.com>
References: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
 <20130211091837.6fd77a1c@skate>
 <CAHXCMM+4H-G4wpwG=uKN-76HcDu0aDEx6hQUhh-BjE+TC86OYw@mail.gmail.com>
Message-ID: <CAHXCMMKu1xW+GBjyuqAyvkK7-W__UGxwty_avg5V-mhn97JsYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?

This patch should fix the following autobuilder failures:
       arm |                 libtirpc-0.2.2 | NOK |
http://autobuild.buildroot.net/results/446d49bcf2b139ccc495d867d898673969823148/
       arm |                 libtirpc-0.2.2 | NOK |
http://autobuild.buildroot.net/results/4d84dfd309d313c8d0248d33bdee43bc7bbfa187/

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130830/03347403/attachment.html>
