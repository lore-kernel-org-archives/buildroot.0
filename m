From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Dec 2019 07:39:48 +0100
Subject: [Buildroot] [PATCH] package/busybox/udhcpc.script: fix network
 interface tag comments
In-Reply-To: <20191225232411.3645a98c@windsurf> (Thomas Petazzoni's message of
 "Wed, 25 Dec 2019 23:24:11 +0100")
References: <20191208233756.GA30928@fifth.space>
 <20191225232411.3645a98c@windsurf>
Message-ID: <87woajpp3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

[the original mail apparently didn't make it to my mailbox?]

Hello,

 > It would be even better if you could describe if you noticed a
 > practical problem with this. In the commit from 2013, the author (Peter
 > Korsgaard) said he checked the glibc and uClibc implementation. Did you
 > encounter a problem with the musl C library ?

Yes, I wonder what the practical issue is? We have used the current
behaviour for a very long time, so chances are that somebody relies on
it somewhere (E.G. I have myself written code to parse /etc/resolv.conf and
used the marker to know what servers came from DHCP or not), so I would
prefer to not change the implementation if at all possible.

-- 
Bye, Peter Korsgaard
