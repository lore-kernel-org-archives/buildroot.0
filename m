From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 15:19:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/audiofile: add security fix
References: <20170527154426.8945-1-bernd.kuhls@t-online.de>
 <20170528150953.226716fe@free-electrons.com>
Message-ID: <ocvqvdxfme.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 28 May 2017 15:09:53 +0200 schrieb Thomas Petazzoni:

> Applied to master, thanks. Just curious: how did you notice that this
> CVE that dates back from 2015 should be fixed?

Hi Thomas,

while trying to fix the symbol collision in mpd when statically linking 
audiofile and libsndfile at the same time I searched for patches already 
addressing the problem in well-known sources (Gentoo, Archlinux, Debian & 
co.) During the search I noticed that Gentoo carries this patch which we 
did not have yet.

Regards, Bernd
