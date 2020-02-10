From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 16:57:13 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <CAJtjsKbZ55Pkb14Y_zTXCuVhcnBTNphzd7MqrG1dnC2pLFpzXw@mail.gmail.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
 <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
 <20200210143008.1895547d@windsurf>
 <CAJtjsKanOr6knqJeDJ84hv-68NdQRs164_NnTAkPsVAB16mYjg@mail.gmail.com>
 <CAJtjsKYB4GkZu5xp-ak9BYEkarqKB6yQiHGf0F1foQf6EjV+qQ@mail.gmail.com>
 <CAJtjsKbZ55Pkb14Y_zTXCuVhcnBTNphzd7MqrG1dnC2pLFpzXw@mail.gmail.com>
Message-ID: <20200210165713.69f99ece@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 16:51:48 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> > There is no deps directory inside lib/ssl/src in the last release of
> > erlang (22.2.6). I guess this was a left over from the guy who made
> > the archive?
> > So my fix proposition to simply sed this file won't work in future
> > erlang versions.  
> 
> I confirm that removing lib/ssl/src/deps directory fix the build issue
> on my machine. I can submit a patch that removes this directory as a
> PRE_CONFIGURE hook, what do you think?

Is this an upstream bug, i.e this folder should not be present in the
release tarball?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
