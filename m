From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 21:45:32 +0100
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <4F3126EB.8000409@labri.fr> (Jigar SOLANKI's message of "Tue, 07
 Feb 2012 14:28:11 +0100")
References: <4F302D71.9020308@labri.fr> <87ipjjvgtg.fsf@macbook.be.48ers.dk>
 <4F3126EB.8000409@labri.fr>
Message-ID: <87fwems783.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:

Hi,

 >> Please provide some more info. Please paste output of ipconfig -a. What
 >> kind of errors do you get?

 Jigar> I do not have any errors. The ping just simply do not respond. The
 Jigar> packets are lost.

 Jigar> There are two interfaces eth0 and lo.

 Jigar> eth0 : 10.10.10.0/24  IP:10.10.10.1 Gw : 10.10.10.254

 Jigar> So, when I ping 10.10.10.254 from 10.10.10.1, I dont have any response :
 Jigar> the packets are lost, tcpdump on the gw (10.10.10.254) shows incoming
 Jigar> ICMP packets, though !

But no reply? If the packets are wellformed the gw should reply. Could
you show up the tcpdump output please?

-- 
Bye, Peter Korsgaard
