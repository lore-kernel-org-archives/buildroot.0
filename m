From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 1 May 2020 22:53:49 +0200
Subject: [Buildroot] [PATCH] package/apparmor: skip docs building
In-Reply-To: <20200429230041.6aa4d9c7@windsurf.home>
References: <1588193351-30086-1-git-send-email-angelo@amarulasolutions.com>
 <20200429230041.6aa4d9c7@windsurf.home>
Message-ID: <CA+_SqVYg6MqsU7r8OOPc6uzSSPBMRr+1QJa__20+R6YG9=MhmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 29, 2020 at 11:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 29 Apr 2020 22:49:11 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > When pod2man and pod2html are missing, building now exits with an
> > error.
> > Building of man pages and documentation should be skipped in buildroot,
> > setting both executables to the "echo" command it's sufficient to skip
> > them.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/ca8d3071d888b5c1cfa3e275afaf05415e19627f
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Would "true" instead of "echo" work as well ?

I did a V2, it works.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
