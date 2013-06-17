From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Jun 2013 08:25:47 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616172508.GL3495@free.fr>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
Message-ID: <51BEABEB.9080102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/13 19:25, Yann E. MORIN wrote:
>>> > >For example, I'd like to catch errors in the packages I've submitted.
>>> > >
>>> > >I see two options for this:
>>> > >   - add a global MAINTAINERS file that list maintainers for each
>>> > >     actively maintained packages (a bit like the Linux kernel does);
>>> > >   - add a FOO_MAINTAINER variable to foo.mk (for each maintained 'foo'
>>> > >     package).
>>> > >
>>> > >Would that be possible?
>> >
>> >Yes that would be possible. For now, I don't have a particularly strong
>> >opinion between the two solutions you proposed. Maybe the second one is
>> >more Buildroot-ish?
> Yes, that's my preferred one.

  I don't really like to clutter the buildroot infrastructure with 
something as ephemeral as a maintainer... A more dynamic way of 
subscribing would be more relevant I think.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
