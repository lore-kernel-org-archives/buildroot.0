From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 18 Jul 2013 01:12:17 -0500
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <20130716201400.GA7947@free.fr>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
 <20130716201400.GA7947@free.fr>
Message-ID: <CAEBucnB9sJ=LX6m5vgVSH1gRQ1nwcTtj9r5HwEKgCxTq=cVvjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> On 2013-07-14 00:10 -0500, Spenser Gilliland spake thusly:
>> +config BR2_PACKAGE_SUNXI_MALI
>> +     bool "sunxi-mali"
>
> Do you plan on looking to the open source driver, lima, as an
> alternative to mali?

Yes, I've been looking at it but I'm not sure we should package it
just yet.  I'm going to work on the ODroidU2 first and come back to
this.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
