From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 20 Jun 2012 14:30:15 +0200
Subject: [Buildroot] [PATCH 1/2] Rework of the init system
In-Reply-To: <4FE174BC.8090904@mind.be>
References: <cover.1338285613.git.maxime.ripard@free-electrons.com>
 <1cbed22cb8b47ae0241f8ab981acb1662eca1f46.1338285613.git.maxime.ripard@free-electrons.com>
 <4FCD449E.9030700@mind.be> <4FDEE7B2.1060502@free-electrons.com>
 <4FE174BC.8090904@mind.be>
Message-ID: <4FE1C257.1020500@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 20/06/2012 08:59, Arnout Vandecappelle a ?crit :
> On 06/18/12 10:32, Maxime Ripard wrote:
>>>> >>  +choice
>>>> >>  +    prompt "Init system"
>>>> >>  +    default BR2_INIT_BUSYBOX
>>>> >>  +
>>>> >>  +config BR2_INIT_BUSYBOX
>>>> >>  +    bool "Busybox"
>>>> >>  +    select BR2_PACKAGE_BUSYBOX
>>> >
>>> >    Ideally, the busybox.mk should make sure init is selected in the
>>> >  busybox config
>>> >  if this option is chosen.
>>
>> I actually did so at first, and you asked me back then to remove it:)
>> (http://lists.busybox.net/pipermail/buildroot/2011-December/048541.html)
> 
>  You misunderstood my comment back then: I'm against _disabling_ the
> busybox init.  The _enable_ should be kept.

Yes, that's what I understood a bit later.
This is what is implemented in the third version of the pull request.

Maxime


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
