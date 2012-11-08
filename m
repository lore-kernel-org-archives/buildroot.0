From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 22:26:01 +0100
Subject: [Buildroot] no jack?
In-Reply-To: <874nl09hs9.fsf@dell.be.48ers.dk>
References: <CAN0CFw31RjieVoSKf9QOAud5yHe6w-oy_J77V9iLYxu2-pSz5g@mail.gmail.com>
 <50999970.3020308@mind.be> <874nl09hs9.fsf@dell.be.48ers.dk>
Message-ID: <509C2369.5060104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 17:32, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>
>   Arnout>  On 06/11/12 22:39, Grant wrote:
>   >>  Is there a jack package available for buildroot?
>
>   Arnout>   No, but it shouldn't be too difficult to integrate.  Look at
>   Arnout>  midori for an example of a package using waf as the build
>   Arnout>  system.
>
> Waf is btw a pain. It seems to fail on one of the autobuilders (host
> python issue?)

  Do you have an autobuilder ref for that?  I can't find any midori build
failures (but since there's no search function...)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
