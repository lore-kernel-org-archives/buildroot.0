From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 22:45:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/zic: bump to version 2019b
In-Reply-To: <20190828222933.11602-1-chrismcc@gmail.com> (Christopher
 McCrory's message of "Wed, 28 Aug 2019 15:29:33 -0700")
References: <20190828222933.11602-1-chrismcc@gmail.com>
Message-ID: <87a7brlmzv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:

 > Changed _SITE to https.
 > Add hash for license file.

 > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
 > ---
 >  package/zic/zic.hash | 6 ++++--
 >  package/zic/zic.mk   | 5 +++--
 >  2 files changed, 7 insertions(+), 4 deletions(-)

 > diff --git a/package/zic/zic.hash b/package/zic/zic.hash
 > index 6b7994731c..385accadf2 100644
 > --- a/package/zic/zic.hash
 > +++ b/package/zic/zic.hash
 > @@ -1,2 +1,4 @@
 > -# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
 > -sha512 4a245cae2d0922b24539a94cf4a8ccc2bba1ee696e0aaefecb41c7c8d78724a7fcea6039909336177b8b26fec8fc47719e3e56ca9839dbaf52f9a4fec84d4717	tzcode2018e.tar.gz
 > +# From https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
 > +sha512 bcfb417fe3b7c39e702da0090291db0489744f733010ae183007fce5e441bfce885fb25ed11730cf7f363572e107d7ff0c4b38691bb99def2d8cf7017c05720f tzcode2019b.tar.gz
 > +# Locally computed:
 > +sha512 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE

This is also a sha256sum. Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
