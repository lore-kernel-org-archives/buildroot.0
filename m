From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 18:51:43 +0100
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
 <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
 <20130121181139.09c586ce@skate>
 <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
Message-ID: <20130121185143.7b62db61@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nigel Sollars,

On Mon, 21 Jan 2013 12:26:41 -0500, Nigel Sollars wrote:

> Oh I see what your saying,  basically the rule is dont use an older
> config.  I am guess that manually changing the config to the new
> location in this instance,  would be good enough for now..

No, the rule is more "we should not break existing configurations". But
sometimes we do, unfortunately. And in many cases, I am the one
responsible for those changes that create incompatibility with existing
configurations.

Arnout recently added a "legacy" mechanism that should, in the future,
help in making such changes less painful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
