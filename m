From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 14:53:24 +0200
Subject: [Buildroot] [PATCH] system/skeleton: fix /etc/group
In-Reply-To: <1429618945-21621-1-git-send-email-bgolaszewski@baylibre.com>
 (Bartosz Golaszewski's message of "Tue, 21 Apr 2015 14:22:25 +0200")
References: <1429618945-21621-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <87618ptzgb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:

 > When using busybox compiled from current git, login emits the following
 > message:

 >     login: /etc/group: bad record

 > Fix it by adding the missing colon to /etc/group in system/skeleton.

Hmm, while the patch looks correct I don't see that error message
here. What is your setup exactly?

-- 
Bye, Peter Korsgaard
