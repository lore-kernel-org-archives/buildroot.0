From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 09:53:25 +0200
Subject: [Buildroot] [PATCH] ipkg: fix ARM MMU-less build
In-Reply-To: <20160726211732.13c7836d@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 26 Jul 2016 21:17:32 +0200")
References: <5593192e371e7a40e09e9b0189f3bfb2432a0e67.1469536052.git.baruch@tkos.co.il>
 <1785552C-C8C3-485A-92F2-11EBD2127B8E@gmail.com>
 <20160726211732.13c7836d@free-electrons.com>
Message-ID: <874m7bzfd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> ipkg has been superceded by opkg. May be it should just be removed?

 > Agreed. I'm hesitating between removing entirely, or marking as
 > deprecated.

I've marked it as deprecated.

-- 
Bye, Peter Korsgaard
