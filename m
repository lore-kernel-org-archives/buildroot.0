From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 10:47:01 +0200
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <20160424083211.GA2129@smipidev>
References: <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
 <20160421132905.7c271814@free-electrons.com>
 <20160423130141.GB10355@smipidev>
 <20160423151129.479c5f03@free-electrons.com>
 <CAPho-_Kvdg37hhfujbg99BVwhP+jPcwnsZUH2=3G7qt0CVz7yw@mail.gmail.com>
 <20160423165013.10739b58@free-electrons.com>
 <20160423161844.GA9825@smipidev>
 <20160423212646.5e6d8f52@free-electrons.com>
 <20160424080407.GB3082@smipidev>
 <20160424101653.4d8d78c5@free-electrons.com>
 <20160424083211.GA2129@smipidev>
Message-ID: <20160424104701.0262d08b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 10:32:11 +0200, Pieter Smith wrote:

> Augment the last message in the series with the defconfig? Easy enough. Will be
> in v5. Or would you like something fancy (E.g. empty commit)?

Yes, just add it in the message of the last commit, something like:

Tested with the following defconfig:

...

But then it should be a minimal defconfig, not one that includes the
kernel and all.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
