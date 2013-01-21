From: Nigel Sollars <nsollars@gmail.com>
Date: Mon, 21 Jan 2013 12:26:41 -0500
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <20130121181139.09c586ce@skate>
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
 <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
 <20130121181139.09c586ce@skate>
Message-ID: <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh I see what your saying,  basically the rule is dont use an older
config.  I am guess that manually changing the config to the new location
in this instance,  would be good enough for now..

Regards
Nigel

On Mon, Jan 21, 2013 at 12:11 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Nigel Sollars,
>
> On Mon, 21 Jan 2013 12:02:02 -0500, Nigel Sollars wrote:
>
> > Confirmed the config file as per menuconfig from the git checkout is
> > still pointing to the older location.
>
> Not sure what you mean exactly. If you remove your configuration and
> start a fresh one, it will automatically have the new location for the
> device table. However, if you keep your existing configuration, then
> there is nothing that will automatically "update" it to the new
> defaults.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/0436d024/attachment-0001.html>
