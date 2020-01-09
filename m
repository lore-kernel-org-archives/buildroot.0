From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 9 Jan 2020 15:58:35 +0100
Subject: [Buildroot] [POC] buildroot packages site
In-Reply-To: <20200103134607.1b6a7f55@windsurf>
References: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
 <20200103132645.6be5a250@windsurf>
 <CAEyMn7YbbC+Nb0PbvFsS=BMh7aEi_nLZaOSS4URYzqfrzwUoYg@mail.gmail.com>
 <20200103134607.1b6a7f55@windsurf>
Message-ID: <CAEyMn7Y497pMZd3hqKypwzOqZ8LE8s4PNz7FYTE1T5xUyVcW7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Fr., 3. Jan. 2020 um 13:46 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Fri, 3 Jan 2020 13:33:28 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > Wow, that's really nice. We definitely want to deploy this as a
> > > replacement to http://autobuild.buildroot.org/stats/. Perhaps we should
> > > even promote this to http://stats.buildroot.org/ or something like that.
> >
> > This sounds good  :-)
>
> OK, let's work on getting this in place. We need to sync with Peter
> Korsgaard to see how it can be deployed on the existing infrastructure.

Is that something we can discuss at Brussel on the Buildroot Developers Meeting?

> > > One question: how did you collect the stats history at
> > > http://packages.buildroot.thiery.it/packages/stats?commit=198bdaadd03f75fe959c21089c354d36c90069bc ?
> >
> > Fist I have a cron job that does updates the latest.json in a fixed
> > interval (e.g. every hour). In addition I use that output and strip
> > the packages stuff from the json with jq and only store the stats part
> > of the output for every day.
> > For having the stats back in the past I have a script that does a
> > checkout for every day in the past and generates this stats output.
>
> OK, sounds good. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Heiko
