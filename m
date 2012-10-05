From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 01:18:33 +0200
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <87ipapxbp2.fsf@macbook.be.48ers.dk>
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk> <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
 <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
 <87ipapxbp2.fsf@macbook.be.48ers.dk>
Message-ID: <506F6AC9.3010702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 15:58, Peter Korsgaard wrote:
>>>>>> "Markos" == Markos Chandras<markos.chandras@gmail.com>  writes:
>
>   Markos>  Hi Peter,
>
>   Markos>  This also happens with the latest strace git code. It seems like
>   Markos>  -D_FILE_OFFSET_BITS=64 is causing it. But there are also some other
>   Markos>  problems in the LFS support. I will see if I can write some patches
>   Markos>  and send them upstream.
>
> Great, thanks!

  Not sure if it is related, but the previous version was already broken for me
on x86_64 builds. Hm, probably not related, because it failed with:

file.c: In function 'printstat64':
file.c:1073:16: error: storage size of 'statbuf' isn't known
file.c:1073:16: warning: unused variable 'statbuf' [-Wunused-variable]


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
