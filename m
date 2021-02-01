From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 13:24:17 +0100
Subject: [Buildroot] Question on udhcpc script
In-Reply-To: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
 (Bhattiprolu RaviKumar's message of "Mon, 1 Feb 2021 16:00:41 +0530")
References: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
Message-ID: <87a6sonfgu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bhattiprolu" == Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com> writes:

 >  All,
 >   We are using busybox to get DHCPv6  address. However, I am bit confused
 > on the part of the script /etc/udhcpc.d/50default:

We don't have have such a script in Buildroot? It looks like yocto does
though:

https://git.yoctoproject.org/cgit.cgi/poky/commit/?id=763b11d0fd6b804c73f0f645a3025c8f82f5aaf1&context=6

Please direct yocto questions to yocto.

-- 
Bye, Peter Korsgaard
