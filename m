From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 00:47:06 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CA62D8.10309@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com> <56CA62D8.10309@zacarias.com.ar>
Message-ID: <56CB9DFA.506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gustavo,

On 02/22/16 02:22, Gustavo Zacarias wrote:
> The thing is keeping all of this split is quite an amount of work, keeping in
> sync/rebasing against master and so on.

 I can imagine!

> I've been sending what most i could in split sets to keep gtk3, wayland and
> webkitgtk going forward in a reasonable way.

 Sounds like a good idea.

> However my patience is wearing quite thin and i'm very tempted to just let
> everything stale, we're about to ship another release with non-existant
> gtk3-wayland support again, a feature that was working just fine a few releases
> ago.

 I'm not sure what your message is here. Do you mean that it's problematic that
we have 291 patches left in patchwork, just after Thomas did about 70 commits? I
think we all agree on that, so if you have a solution, please let us know. Or do
you mean that we should just apply your patches without review? Or are you
complaining that of the 365 patches you submitted since 2015.11, only 338 were
merged up to now?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
