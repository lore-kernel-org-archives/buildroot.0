From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 May 2017 21:59:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: fix download URL
References: <20170528204057.28697-1-bernd.kuhls@t-online.de>
 <20170529215415.39d9e8a3@free-electrons.com>
Message-ID: <75buvdxcra.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 29 May 2017 21:54:15 +0200 schrieb Thomas Petazzoni:

> Applied to master, thanks. Could you contact the upstream developer to
> ask him to stop moving the tarballs around? It is really annoying that
> the latest version is available in http://dist.schmorp.de/libev/, and
> then gets moved to http://dist.schmorp.de/libev/Attic/ as soon as a
> newer version is released.

Hi Thomas,

http://dist.schmorp.de/libev/ contains the current version which is also 
available in Attic/ so I think we should be fine in the future by only 
using Attic/, like I did in my patch.

Regards, Bernd
