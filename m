From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Feb 2012 21:37:47 +0100
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <4F302D71.9020308@labri.fr> (Jigar SOLANKI's message of "Mon, 06
 Feb 2012 20:43:45 +0100")
References: <4F302D71.9020308@labri.fr>
Message-ID: <87ipjjvgtg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:

 Jigar> Hi all,
 Jigar> I've built a Buildroot Linux on a Leon3 CPU, everything works fine
 Jigar> except the network configuration.

 Jigar> I have the eth0 interface configured correctly with a default gw,
 Jigar> netmask etc...but when I ping the interface adress itself, it doesnt
 Jigar> respond at all.

 Jigar> I've also tried to ping 127.0.0.1, same result, lo is not responding.
 Jigar> (I have read some posts on resolv.conf but in my case, it is not a dns
 Jigar> related issue, I ping numerical adresses..)

Please provide some more info. Please paste output of ipconfig -a. What
kind of errors do you get?

-- 
Bye, Peter Korsgaard
