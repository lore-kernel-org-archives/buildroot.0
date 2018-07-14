From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Sat, 14 Jul 2018 21:01:53 +0200
Subject: [Buildroot] [PATCH 1/1] ti-sgx-*: bump from SDK 02.00 to SDK
 04.00
In-Reply-To: <20180706154944.5fa90a51@windsurf>
References: <1527175458-16091-1-git-send-email-tolvupostur@gmail.com>
 <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
 <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
 <CABhNV22Fv+QjYta+XhH5mixGPK5R0sOnMv=R3+4qpV+iqGegzg@mail.gmail.com>
 <20180529234243.699648ec@windsurf.home>
 <CABhNV22Le5eOW9A8LHXS+TJQSishWPS0WPZN2z9r=GkGfMa6xQ@mail.gmail.com>
 <20180530164923.6cce569c@windsurf.home>
 <CABhNV23Ydu+oGfM=zYEbhhgT1e-Rv2igLBdP55Kf2pC4=QmhjQ@mail.gmail.com>
 <CABhNV23ikbKQ7fCyn4fjKAUERnVVrfERuHi38H8qbsszoMRsTA@mail.gmail.com>
 <20180706154944.5fa90a51@windsurf>
Message-ID: <CABhNV23ie0SMmjRxPtg6retsf+mhs4cv_J2jSSC-TaoKT-E+=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again

Please note that this build DOES NOT work.
I get an error loading the graphics libraries, and Lothar also has issues.

This was originally built using the GCC 6.4 toolchain. The update to GCC 7
wasn't caught because I didn't reload the defconfig after the rebase
against origin/master.

I'll try again next week, and only send it in if it clean builds against
master.

Sorry about that,
Einar J?n

On Fri, 6 Jul 2018, 15:49 Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Fri, 6 Jul 2018 15:36:41 +0200, Einar J?n wrote:
>
> > I split this into a set of 3 patches, sent out yesterday
>
> Thanks, seen it. I wanted to give it a try, hopefully next week.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180714/8b01949e/attachment.html>
