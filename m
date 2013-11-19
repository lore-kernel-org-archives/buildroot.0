From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 23:33:13 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <20131119223024.GB3422@free.fr>
References: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
 <528BE378.7030107@mind.be> <20131119223024.GB3422@free.fr>
Message-ID: <528BE729.2090006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 23:30, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2013-11-19 23:17 +0100, Arnout Vandecappelle spake thusly:
>>   The <PKG>_USERS definition doesn't support comments,
>
> Yes, it does. Whatever comes as field #9 and after is treated as the
> comment. See:
>      http://buildroot.net/downloads/manual/manual.html#makeuser-syntax

  With 'comments', I didn't mean the GECOS comment field, but I meant 
'commenting out' a line by putting # in front of it.

>
> But granted, without the *real* helloworld.mk and the *real* Config.in
> (as Thomas has asked for), we can't do much to help... :-(

  I suspect that the problem is that there is some other file which 
defines HELLOWORLD_* in a different way, so the real helloworld.mk 
wouldn't help much...

  Regards,
  Arnout

>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
