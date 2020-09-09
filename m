From: Christian Stewart <christian@paral.in>
Date: Tue, 8 Sep 2020 23:57:55 -0700
Subject: [Buildroot] [go] backport go-module patch series to 2020.08.x?
In-Reply-To: <20200909085416.5d908423@windsurf.hq.k.grp>
References: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
 <20200909085416.5d908423@windsurf.hq.k.grp>
Message-ID: <CA+h8R2ri+dCQQLPTSQUqFcLjx_RPaJothe14tJJs+6f318Sr_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Tue, Sep 8, 2020 at 11:54 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>   Each release cycle consist of two months of development on the master
>   branch and one month stabilization before the release is made. During
>   this phase no new features are added to master, only bugfixes.
>
>   The stabilization phase starts with tagging -rc1, and every week
>   until the release, another release candidate is tagged.

OK, understood, it should keep working fine with the old approach for
all of the packages in the Buildroot tree - (some of my external ones,
not so much).

Unfortunate we couldn't get it into 2020.08.x and 2020.05.x, but I
understand the reasoning.

Everyday my downstream branches stray further from upstream... :)

Best,
Christian
