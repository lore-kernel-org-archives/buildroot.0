From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 09:19:11 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
 <20151224083849.381556a9@free-electrons.com>
 <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
Message-ID: <20151224091911.5380637c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Thu, 24 Dec 2015 09:14:56 +0100, Romain Naour wrote:

> > Can you check if the internal NIOSII toolchain also has this problem or
> > not?
> 
> Actualy, the second build failure was with the internal NIOSII toolchain.

Then it would be good to report the bug to upstream binutils. And
indeed, your patch needs to be adjusted then :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
