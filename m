From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 5 Dec 2020 21:44:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to
 gcc -v
In-Reply-To: <20201205213101.72a80abc@windsurf.home>
References: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
 <20201205213101.72a80abc@windsurf.home>
Message-ID: <CAPi7W80FOkm4g+zKQqpmzCdK-9X9H80ww=q_iJhpjqz9f4G4zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le sam. 5 d?c. 2020 ? 21:31, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Thu,  3 Dec 2020 21:28:53 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Why isn't gcc -v working ?
I don't know, you can see the full trace here:
http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20/rhash-1.4.0/config.log
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
