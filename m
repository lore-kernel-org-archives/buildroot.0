From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 22:58:46 +0200
Subject: [Buildroot] gsoap and code generation
In-Reply-To: <5637116E3E13BE46B0D936BF364783C1F6B84B@MAIA.sede.videotec.com>
References: <5637116E3E13BE46B0D936BF364783C1F6B573@MAIA.sede.videotec.com>
 <20160901153710.2bb43fc7@free-electrons.com>
 <5637116E3E13BE46B0D936BF364783C1F6B84B@MAIA.sede.videotec.com>
Message-ID: <8b0fa497-0df1-ebca-bd80-98a0ee945ddc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 18:23, Ottavio Campana wrote:
[snip]
>>> How can I write a script that compiles a tool for the host and the
>>> libraries for the target?
>>
>> You need two variants of the same package: a host variant and a target
>> variant, i.e host-gsoap (host variant) and gsoap (target variant).
>>
>> The former installs the host utilities needed to generate code at build
>> time while on the host, and the latter installs the libraries
>> cross-compiled for the target.
> 
> The fact that I create two files, let's say gsoap.mk and host-gsoap.mk , already
> lets buildroot know what to compile with the native compiler and what to build
> with the cross-compiler?

https://buildroot.org/downloads/manual/manual.html#generic-package-reference

 Regards,
 Arnout

> 
> Thank you
> 
> Ottavio
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
