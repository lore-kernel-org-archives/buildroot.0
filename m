From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 22:40:05 +0100
Subject: [Buildroot] [pkg-luarocks 1/6] pkg-luarocks: remove
 LUAROCKS_RUN_ENV
In-Reply-To: <CAB0FRssKPcjBCcCiun6azNDMYh4UYy4ypBmbDkDqwKDsAAX49Q@mail.gmail.com>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918093117.5fbd779a@windsurf>
 <CAB0FRssKPcjBCcCiun6azNDMYh4UYy4ypBmbDkDqwKDsAAX49Q@mail.gmail.com>
Message-ID: <20200320224005.021d5754@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

I am getting back to this series, trying to get it finally merged.

On Wed, 18 Sep 2019 20:18:18 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> Le mer. 18 sept. 2019 ? 09:31, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :  
> 
> > On Wed, 18 Sep 2019 08:19:10 +0200
> > Francois Perrad <fperrad@gmail.com> wrote:
> >  
> > > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>  
> >
> > This requires more details in the commit log. Why can you do this ?
> >
> >  
> just a preliminary step,
> could be squashed with the next commit 2/6

So, preliminary steps are good to have separately if possible. But you
still didn't explain how this patch works. How is it possible to simply
delete LUAROCKS_RUN_ENV ? The variables passed in LUAROCKS_RUN_ENV are
not needed ? If they are not needed, why do they exist in the first
place ?

We really need a better explanation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
