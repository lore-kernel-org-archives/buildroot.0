From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jun 2012 08:59:08 +0200
Subject: [Buildroot] [PATCH 1/2] Rework of the init system
In-Reply-To: <4FDEE7B2.1060502@free-electrons.com>
References: <cover.1338285613.git.maxime.ripard@free-electrons.com>
 <1cbed22cb8b47ae0241f8ab981acb1662eca1f46.1338285613.git.maxime.ripard@free-electrons.com>
 <4FCD449E.9030700@mind.be> <4FDEE7B2.1060502@free-electrons.com>
Message-ID: <4FE174BC.8090904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/12 10:32, Maxime Ripard wrote:
>>> >>  +choice
>>> >>  +    prompt "Init system"
>>> >>  +    default BR2_INIT_BUSYBOX
>>> >>  +
>>> >>  +config BR2_INIT_BUSYBOX
>>> >>  +    bool "Busybox"
>>> >>  +    select BR2_PACKAGE_BUSYBOX
>> >
>> >    Ideally, the busybox.mk should make sure init is selected in the
>> >  busybox config
>> >  if this option is chosen.
>
> I actually did so at first, and you asked me back then to remove it:)
> (http://lists.busybox.net/pipermail/buildroot/2011-December/048541.html)

  You misunderstood my comment back then: I'm against _disabling_ the
busybox init.  The _enable_ should be kept.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
