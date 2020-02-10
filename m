From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 17:48:11 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <CAJtjsKZUot++xWhq6DB=eR9qZ46sdo7vXbKpcYnr6RMSa-Phvw@mail.gmail.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
 <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
 <20200210143008.1895547d@windsurf>
 <CAJtjsKanOr6knqJeDJ84hv-68NdQRs164_NnTAkPsVAB16mYjg@mail.gmail.com>
 <CAJtjsKYB4GkZu5xp-ak9BYEkarqKB6yQiHGf0F1foQf6EjV+qQ@mail.gmail.com>
 <CAJtjsKbZ55Pkb14Y_zTXCuVhcnBTNphzd7MqrG1dnC2pLFpzXw@mail.gmail.com>
 <20200210165713.69f99ece@windsurf>
 <CAJtjsKZUot++xWhq6DB=eR9qZ46sdo7vXbKpcYnr6RMSa-Phvw@mail.gmail.com>
Message-ID: <CAJtjsKa_DvMPZDpgdQTVyynxyV0YHL_0EgEH+5BALLOApwgNxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 5:07 PM Johan Oudinet <johan.oudinet@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 4:57 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Is this an upstream bug, i.e this folder should not be present in the
> > release tarball?
>
> I think so, yes. This directory has been removed on the next version : 22.2.1
> Well, we could also simply bump the version. As a minor release, it
> should not require too much effort.

Actually, they don't put minor releases into their download section.
So I think it is best to patch it as I mentioned it. I've also opened
a bug report about it:
https://bugs.erlang.org/browse/ERL-1168

I'll submit the patch in a few minutes.
-- 
Johan
