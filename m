From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 8 Sep 2015 21:41:45 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=+9ooyZfHE8yR2T=1cU+Snukctp54m66gDUvxW0WvJ5yQ@mail.gmail.com>
References: <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be>
 <20150908090719.GA14056@waldemar-brodkorb.de>
 <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
 <55EEFDA1.6070104@mind.be>
 <CAF5aO=LPauPtHe2EeYmBQ-2BQjcL+POfZVHAWxaujQ01vMmQKA@mail.gmail.com>
 <CAF5aO=+9ooyZfHE8yR2T=1cU+Snukctp54m66gDUvxW0WvJ5yQ@mail.gmail.com>
Message-ID: <20150908194145.GR8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,
Alex Potapenko wrote,

> P.S. LFS is enabled:
> 
>     UCLIBC_HAS_LFS=y
> 
> ?
> in the custom config

Can you compile attached test program and execute
it on your target with a file in /opt and some other partition.
I want to see if the problem is really related to fstat.
Please link it statically.

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fstat-tst.c
Type: text/x-csrc
Size: 615 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/a6145be2/attachment.c>
