From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sun, 30 Nov 2014 13:09:11 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static builds
In-Reply-To: <20141130113557.GB4124@free.fr>
References: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
 <20141130113557.GB4124@free.fr>
Message-ID: <1417349351.882.7.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On So, 2014-11-30 at 12:35 +0100, Yann E. MORIN wrote:
> 
> All three patches applied upstream:
>     https://github.com/mikebrady/shairport-sync/commit/2a430ec434674ed8c1959698c061662bb7abc1a1
>     https://github.com/mikebrady/shairport-sync/commit/e5a74a3ff08134a2b11f07bd850659d7816fb03d
>     https://github.com/mikebrady/shairport-sync/commit/1f759e57e8c0682613eaaf89a46fdf6db4c6b5cd
> 
> There is now a new release with those three patches, but that would make
> us bump pass a few releases, from 2.1.8 to 2.1.13, with some new
> features along the lines.
> 
> So, for the release, I suggest we just apply those three patches, and
> I'll send a version bump after the release has been cut.
> 
> Is that OK?

First, many thanks for your work! I had a look at the autobuild errors,
but it was beyond my knowledge.

Version 2.1.9 to 2.1.13 include several bugfixes, so I would suggest to
update the package. I can make a run-time test tomorrow.
