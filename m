From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Nov 2012 14:27:03 +0100
Subject: [Buildroot] gcc on target system issue
In-Reply-To: <CABtOAfyM4gF-AUi0cNSusC542dxcRps=TM20pJe3RdXWU69AuA@mail.gmail.com>
References: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
 <20121116183044.6dcfc297@skate>
 <CABtOAfyM4gF-AUi0cNSusC542dxcRps=TM20pJe3RdXWU69AuA@mail.gmail.com>
Message-ID: <50A8E227.1090300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/12 22:59, Alexander Khryukin wrote:
>
>
> 2012/11/16 Thomas Petazzoni <thomas.petazzoni at free-electrons.com <mailto:thomas.petazzoni@free-electrons.com>>
>
>>     Dear Alexander Khryukin,
>>
>>     On Fri, 16 Nov 2012 01:20:32 +0300, Alexander Khryukin wrote:
>>
>>     >  I'm trying to build gcc on target but it fails with
>>
>>     Why are you trying to build gcc on target? What is the purpose of
>>     getting gcc on the target when building a small embedded Linux system
>>     with Buildroot?
>>
>>     Notice that as per the decisions taken during the last Buildroot
>>     Developers Meeting, the possibility of building gcc for the target in
>>     Buildroot should soon be deprecated. So there is not a strong interest
>>     to fix problems reported by users.
>
>
> Ah, it bad solution to deprecate gcc on target.

  Well, the problem is that it is more or less broken (as you can testify), and
that nobody is motivated to invest energy into making it work.  If you find the
time and resources to fix and maintain gcc on target, and you have a relevant
use case, then there is a possibility to undeprecate it again.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
