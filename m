From: Jan Pohanka <xhpohanka@gmail.com>
Date: Wed, 15 Aug 2012 14:45:52 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
In-Reply-To: <20120810215623.5d7304a5@skate>
References: <op.wirpbfhyyxxkfz@pohanka-pc> <20120810085836.3c62fe7e@skate>
 <op.witduljwyxxkfz@pohanka-pc> <20120810215623.5d7304a5@skate>
Message-ID: <op.wi21qq1byxxkfz@pohanka-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

have you found the example I posted useful to extract some information,  
please? I would like to solve that issue.

regards
Jan

Dne Fri, 10 Aug 2012 21:56:23 +0200 Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> napsal(a):

> Hello,
>
> Le Fri, 10 Aug 2012 09:31:23 +0200,
> "Jan Pohanka" <xhpohanka@gmail.com> a ?crit :
>
>> Now I also discovered that the problem is machine specific. I have two
>> hosts using exactly the same cross-compiler and buildroot. One works and
>> the second one (my workstation) does not.
>>
>> working host (Ubuntu 11.10) uname -a
>> Linux linux-dev 3.0.0-23-server #39-Ubuntu SMP Thu Jul 19 19:37:41 UTC
>> 2012 x86_64 x86_64 x86_64 GNU/Linux
>>
>> my workstation (Ubuntu 12.04 lts) uname -a
>> Linux pohanka-pc 3.2.0-27-generic #43-Ubuntu SMP Fri Jul 6 14:25:57 UTC
>> 2012 x86_64 x86_64 x86_64 GNU/Linux
>
> The toolchain is not downloaded by Buildroot in your .config. Are you
> sure you have the same toolchain on both build machines?
>
> Also, could you put online:
>
>  - A complete build log on both machines (make clean && make)
>  - The two binaries that are different and causing problems
>
> Best regards,
>
> Thomas


-- 
Tato zpr?va byla vytvo?ena p?evratn?m po?tovn?m klientem Opery:  
http://www.opera.com/mail/
