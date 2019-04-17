From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 18 Apr 2019 00:53:27 +0200
Subject: [Buildroot] Qt5 parallel build of qmake
In-Reply-To: <5affd9e5-511b-394c-e2a0-51617489f1c1@mind.be>
References: <5affd9e5-511b-394c-e2a0-51617489f1c1@mind.be>
Message-ID: <823bb0b7-aa62-d682-9cb7-f17471ff4926@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Il 18/04/2019 00:16, Arnout Vandecappelle ha scritto:
>   Hi all,
> 
>   I've put a few people in Cc that seem to be active users of Qt5.
> 
>   I noticed during a test build that during the configure step, qmake is built
> but not in parallel. I think it should be possible to enable parallel build for
> qmake by passing MAKE="$(MAKE)" in the environment during configuration. Would
> someone be interested in checking that out?

I am interested. I'll try to have it working, let's see if I'm able.

>   Ideally, you should also test with different make versions because they
> sometimes throw other stuff in the MAKE variable which may screw things up.

How much back should I go with make versions?
I mean, now I have 4.1, maybe back to 3.82?
Or more?

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>   Regards,
>   Arnout
> 
