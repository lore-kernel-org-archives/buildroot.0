From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 10:25:09 +0200
Subject: [Buildroot] Make sfdisk work
In-Reply-To: <5d75f4610707140035n5a40b425u590a6bac78fa5ca8@mail.gmail.com>
References: <5d75f4610707140035n5a40b425u590a6bac78fa5ca8@mail.gmail.com>
Message-ID: <1184401509.4954.29.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-07-14 klockan 14:35 +0700 skrev BuraphaLinux Server:
> Attached is a patch for sfdisk to make it work.  I sent it some time
> ago but heard nothing back.  If the patch is bad, please tell me why.

Looks to me that you "fix" sfdisk by restricting the size of the disk to
< 4 GB

Best Regards
Ulf Samuelsson
