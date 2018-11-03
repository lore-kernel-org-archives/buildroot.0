From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 3 Nov 2018 20:25:41 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <400754389.13590.1541211606004.JavaMail.zimbra@datacom.com.br>
References: <20181024143616.GA31663@scaer>
 <20181025002043.2235-1-casantos@datacom.com.br>
 <20181101210103.GX28575@scaer>
 <400754389.13590.1541211606004.JavaMail.zimbra@datacom.com.br>
Message-ID: <1338398979.26630.1541283941592.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "DATACOM" <casantos@datacom.com.br>
> To: "Yann Morin" <yann.morin.1998@free.fr>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Sexta-feira, 2 de novembro de 2018 23:20:06
> Subject: Re: [Buildroot] [PATCH v2] fs: allow filesystems to set the name of their output file

>> From: "Yann Morin" <yann.morin.1998@free.fr>
>> To: "DATACOM" <casantos@datacom.com.br>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Sent: Quinta-feira, 1 de novembro de 2018 18:01:03
>> Subject: Re: [PATCH v2] fs: allow filesystems to set the name of their output
>> file
> 
>>> +ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(call qstrip,$$(ROOTFS_$()_IMAGE_NAME))
>>                                                           ^^^
>> 
>> This patch has not been tested at all, it can't even possibly work...
> 
> Pfff, I will send a follow-up fixing that. Sorry.
> 
> Scratching my head attempting to find how it happened.

FYI: I figured out the reason why the buggy patch was sent but I won't
tell ya because it is too much embarrassing. :-(

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
