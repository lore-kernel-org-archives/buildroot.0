From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 03 Sep 2020 19:48:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/spandsp: needs jpeg support in
 tiff package
References: <20200903053248.475324-1-bernd.kuhls@t-online.de>
 <20200903135928.13f96757@windsurf.home>
Message-ID: <3tm72hx67d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 03 Sep 2020 13:59:28 +0200 schrieb Thomas Petazzoni:

> As usual, could you indicate if this is a new issue (i.e since the merge
> of next into master), or an older issue we need to consider for
> 2020.02.x or other maintained stable branches.

Hi Thomas,

the upstream commit causing the autobuilder error

https://github.com/freeswitch/spandsp/commit/
be0bce3dbc4b33f92e8da985900104b857259d02#diff-67e997bcfdac55191033d57a16d1408aR550

is not present in the previous version of spandsp so this error is 
specific to the master branch.

Regards, Bernd
