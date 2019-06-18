From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Jun 2019 21:33:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: update S10mdev
In-Reply-To: <f5b12853-22d5-2d4a-8ddc-0e66f97c788e@railnova.eu> (Titouan
 Christophe's message of "Sun, 16 Jun 2019 22:15:04 +0200")
References: <20190529142528.256795-1-titouan.christophe@railnova.eu>
 <20190614172647.GA32315@smile.fi.intel.com>
 <f5b12853-22d5-2d4a-8ddc-0e66f97c788e@railnova.eu>
Message-ID: <87o92uheo2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

Hi,

 > In the meantime Busybox did introduce the daemon mode for mdev, which
 > renders this patch obsolete (see the thread "linux: enable
 > UEVENT_HELPER when mdev is used" over there
 > http://lists.busybox.net/pipermail/buildroot/2019-June/251744.html).

 > I discussed this with Arnout on IRC, and the outcome is that we will
 > adapt the S10mdev script to use the new daemon mode as soon as the
 > next Busybox release is available.

Busybox 1.31.0 was released last week with this new daemon option:

https://busybox.net/

-- 
Bye, Peter Korsgaard
