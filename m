From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 20 Mar 2014 11:01:44 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <20140319183523.GA3328@free.fr>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
 <5326A778.7070507@mind.be>
 <CAHkwnC8+MsDLUd5XMU1GDmfNBCVU0p9JTaUmpWiYReTrSsAnKQ@mail.gmail.com>
 <532983A0.9050107@mind.be> <20140319183523.GA3328@free.fr>
Message-ID: <CAHkwnC9mHqrkK00i9yU-kW097-dhCjcv-Z3PvYOQzYmLF_ntrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 19, 2014 at 7:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, Arnout, All,
>
> On 2014-03-19 12:46 +0100, Arnout Vandecappelle spake thusly:
>> On 19/03/14 12:10, Fabio Porcedda wrote:
> [--SNIP--]
>> > Take in account that the "toolchain" target is always built because is
>> > a dependency of the "busybox" package that is always build and cannot
>> > be disabled and
>> > the "toolchain-buildroot" and "toolchain-external" are always enabled
>> > in the Config.in.
>>
>>  busybox can be disabled (if you set the init system to "none").
>
> Indeed, and I very often uses that when I want to just test a single
> package I'm adding.

Good idea, next time i will test a package i will do that.

Thanks
-- 
Fabio Porcedda
