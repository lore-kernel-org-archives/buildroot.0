From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 29 Jun 2020 14:16:55 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <20200629140738.7dd4749d@windsurf>
References: <20200621213921.11923-1-peter@korsgaard.com>
 <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
 <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
 <20200629140738.7dd4749d@windsurf>
Message-ID: <CAAXf6LUU13bLkYuNFWb7suK5b4mb8ppysKaAM=oLS5FxmN=Q6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 29 jun. 2020 a las 14:07, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi?:

> Hello,
>
> On Mon, 29 Jun 2020 12:51:02 +0200
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > Which reminds me of the fact that the package stats and associated CVE
> > detection is currently only running on the master branch (that I know
> of).
> > Which means that we are missing the CVE detection on the LTS branch.
> > Does it take a lot of resources / Is it hard to do, enabling this on the
> > LTS branch too (mostly the CVE part) ?
>
> Running pkg-stats on other branches is really easy, I can make it
> generate autobuild.buildroot/stats/2020.02.x.{html,json} for example.
>
> However, what needs a bit more effort is to modify the e-mail
> notification script to make use of that.
>
> Note that my colleague Gr?gory is working on improving the CVE
> infrastructure so that you can run a script on your specific Buildroot
> version and configuration, and get the list of CVEs you are affected
> by. I.e the same results as pkg-stats, but really tailored to your
> Buildroot version/configuration. Hopefully Gr?gory will send the
> patches soon.
>

That sounds great, this will be very useful!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/a7ff9c57/attachment.html>
