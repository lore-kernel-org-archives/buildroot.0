From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Apr 2019 19:19:03 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata
 from packages (branch yem/misc)
In-Reply-To: <27920e20-8b65-1a38-d82a-edad8b289bce@mind.be>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <20190411192651.5196cd1c@windsurf.home>
 <20190411212002.GG2539@scaer>
 <27920e20-8b65-1a38-d82a-edad8b289bce@mind.be>
Message-ID: <20190413171903.GN2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-13 10:00 +0200, Arnout Vandecappelle spake thusly:
> On 11/04/2019 23:20, Yann E. MORIN wrote:
> >> I'm not at all saying that we shouldn't merge this JSON output, I just
> >> wanted to point out the different ways that already exist to extract
> >> some package metadata out of Buildroot.
> > Well, my idea wuld maybe to actually phase-out those rules, or at least
> > base them on this new JSON output.
> > 
> > Heck, even graph-depends could use that instead of the recently
> > introduced show-dependency-tree, and this is what I was going to do
> > before the release, so that show-dependency-tree never ever gets into
> > a release.
> 
>  Indeed, I think show-info can replace a lot of our special targets:
> show-version, show-*depends, external-deps.

I already changed graph-depends to use that instead of show-dependency-graph.
That wil be in v2.

Also, I have a patch removing show-dependency-graph altogether, since it
no longer is useful, and never made it to a release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
