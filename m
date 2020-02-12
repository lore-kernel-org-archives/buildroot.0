From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Feb 2020 10:22:19 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
In-Reply-To: <CAB0FRsvs4Rm-ZHvSsDgZHijSM1qL7ygsWAhaK=S_cDdWC+n80Q@mail.gmail.com>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20200205181702.4abbbd83@windsurf>
 <CAB0FRsvs4Rm-ZHvSsDgZHijSM1qL7ygsWAhaK=S_cDdWC+n80Q@mail.gmail.com>
Message-ID: <20200212102219.1bf92791@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Fri, 7 Feb 2020 17:58:57 +0100
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> >  - Using the Buildroot distribution in release-monitoring and its
> >    mapping concept. In this case, we really want to use the Buildroot
> >    package name unchanged (which is not what your patch does)
>
> It means that a part of Buildroot source (or configuration) is hosted on
> release-monitoring.org instead of our own git repository.

Not really. What is stored on release-monitoring side is the mapping of
Buildroot package name to release-monitoring.org project names.

If we were to store this information on the Buildroot side, we could
say "it's a release-monitoring.org information that is stored inside
the Buildroot source code".

> Another point about release-monitoring.org,
> how to exclude `dev` branches when the policy of the upstream project is to
> name them with an odd minor number ?

This is a known issue, see
https://github.com/fedora-infra/anitya/issues/753. It would be great if
someone could work on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
