From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Feb 2012 23:38:13 +0100
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <87fwems783.fsf@macbook.be.48ers.dk>
References: <4F302D71.9020308@labri.fr> <4F3126EB.8000409@labri.fr>
 <87fwems783.fsf@macbook.be.48ers.dk>
Message-ID: <201202082338.13714.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 21:45:32 Peter Korsgaard wrote:
> >>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
> Hi,
> 
>  >> Please provide some more info. Please paste output of ipconfig -a. What
>  >> kind of errors do you get?
> 
>  Jigar> I do not have any errors. The ping just simply do not respond. The
>  Jigar> packets are lost.
> 
>  Jigar> There are two interfaces eth0 and lo.
> 
>  Jigar> eth0 : 10.10.10.0/24  IP:10.10.10.1 Gw : 10.10.10.254
> 
>  Jigar> So, when I ping 10.10.10.254 from 10.10.10.1, I dont have any response :
>  Jigar> the packets are lost, tcpdump on the gw (10.10.10.254) shows incoming
>  Jigar> ICMP packets, though !
> 
> But no reply? If the packets are wellformed the gw should reply. Could
> you show up the tcpdump output please?

 Maybe also a kernel defconfig?  'make linux-savedefconfig' and attach the 
output/linux-*/defconfig.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
