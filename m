From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Mar 2013 18:44:14 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
 errnopatch to 0.9.33.2"
In-Reply-To: <87lia39c5g.fsf@dell.be.48ers.dk>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk> <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
 <51276813.7050604@zacarias.com.ar> <9E7C87F7A6274E3EBBC491EE4122270E@JohanW7>
 <87lia39c5g.fsf@dell.be.48ers.dk>
Message-ID: <5137806E.4020507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/13 20:51, Peter Korsgaard wrote:
>>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
>
>   Sagaert> Hi
>
>   Sagaert> It took some time till I could verify it against real hardware.
>
>   Sagaert> I switched to NTPL and so far got no problems with any package.
>
>   Sagaert> It's a bit mysterious when to use the other options (pthreads
>   Sagaert> and pthreads old).  Incompatible packages mostly do build, but
>   Sagaert> the problems show up at runtime.
>
> The pthreads options are basically just there for legacy reasons (from
> before NPTL existed) and presumably see very little testing these
> days. We should aguable deprecate them.

  That would be a good idea. For who really wants it, there is still the 
crosstool-NG toolchain.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
