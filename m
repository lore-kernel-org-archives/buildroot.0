From: Alex Potapenko <opotapenko@gmail.com>
Date: Tue, 8 Sep 2015 18:58:33 +0300
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=LPauPtHe2EeYmBQ-2BQjcL+POfZVHAWxaujQ01vMmQKA@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be>
 <20150908090719.GA14056@waldemar-brodkorb.de>
 <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
 <55EEFDA1.6070104@mind.be>
 <CAF5aO=LPauPtHe2EeYmBQ-2BQjcL+POfZVHAWxaujQ01vMmQKA@mail.gmail.com>
Message-ID: <CAF5aO=+9ooyZfHE8yR2T=1cU+Snukctp54m66gDUvxW0WvJ5yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

P.S. LFS is enabled:

> UCLIBC_HAS_LFS=y


in the custom config

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/2d5fd06b/attachment.html>
