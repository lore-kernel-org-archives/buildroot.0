From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 12:23:59 +0100
Subject: [Buildroot] Handling delays in network interface visibility in
 Raspberry Pi 3
In-Reply-To: <3FF68F6E-0A60-4171-94ED-640214A6F0EF@grondman.net> (Ivo
 Grondman's message of "Tue, 16 Feb 2021 11:37:26 +0100")
References: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
 <87r1lh9eiz.fsf@dell.be.48ers.dk>
 <3FF68F6E-0A60-4171-94ED-640214A6F0EF@grondman.net>
Message-ID: <87wnv88ddc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivo" == Ivo Grondman <buildroot@grondman.net> writes:

Hi,

 > Turned out I was using an old cable only capable of 100BASE-TX
 > (i.e. it only had 2 wire pairs). Replacing it with a cable with all 4
 > wire pairs in it did the trick, even when still behind the switch and
 > the power line adapter. Never had problems with that cable before
 > (didn?t care about the speed difference), but apparently in this case
 > it was the culprit of slow link negotiation.

Ok, good to hear that you solved it!

-- 
Bye, Peter Korsgaard
