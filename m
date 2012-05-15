From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 08:27:43 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
In-Reply-To: <87d3661soa.fsf@macbook.be.48ers.dk>
References: <1336847275-21899-1-git-send-email-arnout@mind.be>
 <20120512210755.672039a4@skate> <4FAEC2F4.1060802@mind.be>
 <87d3661soa.fsf@macbook.be.48ers.dk>
Message-ID: <4FB1F75F.5050100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/12 21:14, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>
> Hi,
>
>   Arnout>   This is BTW from one of the broken configs reported in the
>   Arnout>  autobuild, from which I also had to remove some more broken
>   Arnout>  packages (ltp-testsuite, ndisc6).  It's a generic powerpc internal
>   Arnout>  toolchain.
>
> ltp-testsuite is known to be broken with the default uClibc config, but
> I wasn't aware of any ndisc6 issues. What exactly goes wrong?

   It's a gettext issue. I haven't looked at it because I was fixing something else,
and because gettext anyway had patches pending.

  There are plenty of failures in autobuild, e.g.
http://autobuild.buildroot.net/results/1405f403f53624667c3d104a4e8f0c070501a639/

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
