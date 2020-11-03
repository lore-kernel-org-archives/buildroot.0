From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 3 Nov 2020 22:56:57 +0100
Subject: [Buildroot] [PATCH v6 4/4] package/environment-setup: adding
 custom PS1
In-Reply-To: <20201103224626.5bd491bd@windsurf.home>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
 <1588085161-28104-4-git-send-email-angelo@amarulasolutions.com>
 <20201103224626.5bd491bd@windsurf.home>
Message-ID: <CA+_SqVbWR=MHs6M9o=WOvJE0eYFBhFesq+4J-Q-OjpYpqg0QVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 3, 2020 at 10:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 28 Apr 2020 16:46:01 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > In order to simplify the usage of a buildroot toolchain within
> > the buildroot shell, a custom PS1 is optionally available.
> > This PS1 will show the sdk version actually loaded, this can
> > be useful to not confuse this shell with a normal one.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >  package/environment-setup/Config.in.host       | 10 ++++++++++
> >  package/environment-setup/environment-setup.mk |  3 +++
> >  2 files changed, 13 insertions(+)
>
> I've marked this one as Rejected: since the beginning Yann has
> expressed that changing the PS1 of the user was not acceptable, and we
> believe indeed it shouldn't be changed. Also, it's probably not the
> most important aspect of environment-setup.

I honestly totally disagree. I consider having a custom PS1 quite
important, I had several funny moments understand why I was having a
python version on a shell and a totally different python version on
the next one.
Restoring your old PS1 is quite easy and people like Yann will not use
the buildroot shell anyway ;)
The feature was of course taught for the average daily programmer who
needs to know boldly where he is running what.

Anyway, I'm happy this series was finally accepted, I would post some
more things in the feature.

Thanks

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 

Angelo Compagnucci

Amarula Solutions SRL

Embedded Linux Developer

Via Le Canevare 30 31100 Treviso IT

T. +390422435310

M. +393479922139

[`as] https://www.amarulasolutions.com|
