From: Ludovic.Desroches at microchip.com <Ludovic.Desroches@microchip.com>
Date: Wed, 17 Feb 2021 13:58:35 +0000
Subject: [Buildroot] Buildroot defconfig issues
In-Reply-To: <e957b8a1-b7aa-67e1-cbd6-784a784c11b5@mind.be>
References: <6025e87c3e3ce_c6a70d4128370@gitlab-sidekiq-catchall-v1-bb68c6455-8rbvh.mail>
 <20210212091348.75f9cd17@windsurf.home>
 <582a548d-b9e3-39dc-f234-10a31e0a355d@mind.be>
 <20210212092458.165a3ec7@windsurf.home>
 <e957b8a1-b7aa-67e1-cbd6-784a784c11b5@mind.be>
Message-ID: <20210217135835.cujzg3cdsqntwb7h@sekiro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe

On Fri, 12 Feb 2021 10:41:26 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > But Arnout, I thought you were inclined to having "demo" defconfigs in
> > Buildroot upstream. Have you changed your mind ?
>
> "demo", yes. Like qt5we. It's good to have one defconfig which adds qt5we
> because otherwise that package hardly ever gets tested (it has so many
> dependencies that it's very unlikely to get built in the autobuilders). Also the
> other _qt5_ configs make sense, because it can be quite hard to select the
> correct graphical stuff for a specific board - the qt5 part is not really
> needed, but it's a nice way of showing something actually working rather than
> simply building.
>
>  But the _dev_ things simply select a bunch of packages that are useful for
> development. It's not at all necessarily the set of tools that any particular
> developer will actually use, and it's not very helpful for testing some specific
> package, and there's nothing specific for that platform in it.
>
>  It's possible that I'm a bit changing my mind here, because I didn't realize
> that last bit before. And for sure: if such a config is giving us pain (e.g., it
> doesn't build :-) then rather than spend time on investigating, I'd want to just
> remove it!

I agree that these "dev" defconfigs simply have a somewhat "random"
selection of tools that are not aimed at providing any particular demo.
So I'm fine with the choice of dropping them.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
