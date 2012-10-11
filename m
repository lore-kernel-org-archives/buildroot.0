From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2012 23:26:32 +0200
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <CAG2jQ8hPXUt7sR5p3Tq1enqO3uYNXEX+N6=yUynLWZHhDnp=2Q@mail.gmail.com>
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk> <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
 <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
 <87ipapxbp2.fsf@macbook.be.48ers.dk> <506F6AC9.3010702@mind.be>
 <CAG2jQ8hPXUt7sR5p3Tq1enqO3uYNXEX+N6=yUynLWZHhDnp=2Q@mail.gmail.com>
Message-ID: <50773988.6070904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/12 14:49, Markos Chandras wrote:
> On Sat, Oct 6, 2012 at 12:18 AM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>>   Not sure if it is related, but the previous version was already broken for me
>> on x86_64 builds. Hm, probably not related, because it failed with:
>>
>> file.c: In function 'printstat64':
>> file.c:1073:16: error: storage size of 'statbuf' isn't known
>> file.c:1073:16: warning: unused variable 'statbuf' [-Wunused-variable]
>>

> I reported this problem upstream about an hour ago (with a proposed
> patch included)
>
> http://sourceforge.net/mailarchive/message.php?msg_id=29947462

  Is this only on x86_64 or also on other 64-bit platforms?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
