From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 22 Oct 2014 16:10:46 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
	conditional
In-Reply-To: <20141020162811.4c3e2ce5@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
 <54450F51.5050801@zacarias.com.ar>
 <20141020153719.034df3be@free-electrons.com>
 <54451174.5060309@zacarias.com.ar>
 <20141020155447.21c7c7ff@free-electrons.com>
 <5445185C.6020604@zacarias.com.ar>
 <20141020162811.4c3e2ce5@free-electrons.com>
Message-ID: <CAGduivwEezhtmw0OfpqELQs2k3sGF_StUdC7hyqAWuKXj6u1yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Gustavo, all,

On Mon, Oct 20, 2014 at 4:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 20 Oct 2014 11:12:44 -0300, Gustavo Zacarias wrote:
>
>> Not at all, already done in private initscript revamp, but not in an
>> upstreamable/generic way since it's not finished, part of my
>> configurable sysv initscripts (i think i've mentioned the idea on the ML
>> and/or IRC).
>> I dunno if Maxime or someone else is working on anything similar since
>> i'm somewhat outside the loop, and my motivation is pretty low as i've
>> already said.
>
> Well, Maxime is still pushing his initscripts package to make sure a
> root filesystem with systemd is not cluttered with an /etc/init.d/
> directory. I don't know if he intends to go further than that.
I would like to have a much better control over what's installed from
the initscripts (or other) package. I don't have, yet, a clear idea of
what I'd like but Gustavo, if you started working on this, maybe I
could help ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
