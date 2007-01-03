From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 3 Jan 2007 10:35:07 +0100
Subject: [Buildroot] offline buiding
References: <ed4892840701030051q6893bf0bq4ac3f7427532f970@mail.gmail.com>
Message-ID: <024c01c72f1a$7ee6f970$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> hi,
> 
> i am about to use buidroot to build a cross toolchain on a linux host.
> but the host does not get an internet connection.  after read the
> intro of buildroot, i found it need to grab files on internet in the
> building process.  is there an offline building mode? thanks.
> 
> -- 
> woody

buildroot caches everything to the "buildroot/dl" directory
(This can be changed by "make menuconfig")
so if you put all needed packages in that directory, you
do not need to have to be online.

Best Regards
Ulf Samuelsson
