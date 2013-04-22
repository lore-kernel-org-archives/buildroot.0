From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 23:19:22 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: move patches to new model
In-Reply-To: <51758AD3.9040207@zacarias.com.ar>
References: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
 <51757EF2.3060000@mind.be> <51758AD3.9040207@zacarias.com.ar>
Message-ID: <5175A95A.90006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 21:09, Gustavo Zacarias wrote:
> On 04/22/2013 03:18 PM, Arnout Vandecappelle wrote:
>>   I believe the idea was to have plain NNNN-xxxx.patch files (without
>> package or version number) in the patch directories - like is the case
>> already for gcc and gdb. But check the developer day report to be sure.
>>
>>   And while you're at it, numbering the patches would be nice.
>
> Historically the busybox patches were left untouched (simple wget, no
> SoB and such).
> If Peter is OK with following the standard i couldn't agree more and
> send a V2 :)

  I'm just talking about the filename, not the contents of the patches.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
