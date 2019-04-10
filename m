From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Apr 2019 20:22:28 +0200
Subject: [Buildroot] [PATCH 1/4] package/squeezelite: bump to version
 71c012ad9ba102feb95823b7b9dc17e5305689c7
In-Reply-To: <20190410194155.514d767d@windsurf.home>
References: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
 <20190410194155.514d767d@windsurf.home>
Message-ID: <CAPi7W81nDK5D+cEEgxj7xydQdUCK2N8YLhPMFhoa9Vkg-DX1YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le mer. 10 avr. 2019 ? 19:41, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  6 Apr 2019 18:57:57 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Switch site to https://github.com/ralph-irving/squeezelite
>
> What makes this upstream better / more official than the current one
> we're using ? Admittedly, the current one doesn't look very official
> either, but I'm curious about how you decided to choose this "other"
> upstream.
The current upstream has been automatically exported from
code.google.com/p/squeezelite and has seen no updates since 4 years.

The new upstream:
 - is active (updated nineteen days ago)
 - included our four patches
 - is declared as the official repository on wikipedia
(https://en.wikipedia.org/wiki/Squeezelite)
 - has drawn interest from debian maintainer
(https://github.com/ralph-irving/squeezelite/issues/29) even if debian
did not switch to this fork (probably because of the lack of official
releases).

That's why I decided to choose it as the "new" upstream.
I'll open a new issue on github to ask for a new release.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
