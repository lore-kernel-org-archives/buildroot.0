From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Aug 2014 17:23:18 +0200
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
 calls with a single call
In-Reply-To: <87fvh6agvg.fsf@dell.be.48ers.dk>
References: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
 <20140803073726.GB4052@free.fr>
 <CANxTyt70cnBy56QgMjGSMc092fEx9O-yWwegcL6S2kRtR0dSzQ@mail.gmail.com>
 <20140804102456.774bcea3@free-electrons.com>
 <20140804091755.GL32743@waldemar-brodkorb.de>
 <87fvh6agvg.fsf@dell.be.48ers.dk>
Message-ID: <20140809172318.42fe0e92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 08 Aug 2014 22:03:31 +0200, Peter Korsgaard wrote:

>  > It allows smooth updates without loosing device configuration data.
> 
>  > Any interest in porting it to buildroot?
> 
> We try hard to not enforce policy, so I wouldn't want to make cfgfs a
> required package, but as an optional one it make sense. Please do.

Agreed. We clearly don't want people to be forced to use something such
as cfgfs, but it would definitely be useful to have that as an option.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
