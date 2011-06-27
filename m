From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jun 2011 12:12:03 +0200
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <20110627033240.GA3046@jasper.tkos.co.il> (Baruch Siach's message
 of "Mon, 27 Jun 2011 06:32:41 +0300")
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
 <20110626032236.GA17733@tarshish> <87mxh47v71.fsf@macbook.be.48ers.dk>
 <BANLkTi=hr=U5eMmPbsUB-WH_QYjamGR5qA@mail.gmail.com>
 <20110627033240.GA3046@jasper.tkos.co.il>
Message-ID: <87pqlz60ss.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Is there a busybox config setup for /dev/shm? I went through the busybox
 >> menuconfig this morning and I don't see one.

 Baruch> There is nothing related to Busybox here. All you need to do is
 Baruch> to create the /dev/shm directory, and then mount tmpfs on it.

You don't even need the mount if you are using devtmpfs (which you imho
should).

-- 
Bye, Peter Korsgaard
