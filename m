From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 16:07:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump to version 11
In-Reply-To: <1558296305-18316-1-git-send-email-ptvsf@cesar.org.br> (Paulo
 Serra Filho's message of "Sun, 19 May 2019 17:05:05 -0300")
References: <1558296305-18316-1-git-send-email-ptvsf@cesar.org.br>
Message-ID: <87woilusll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulo" == Paulo Serra Filho <ptvsf@cesar.org.br> writes:

 > Add GPT support and new options for partitions and images creation.
 > Signed-off-by: Paulo Serra Filho <ptvsf@cesar.org.br>
 > ---
 >  package/genimage/genimage.hash | 2 +-
 >  package/genimage/genimage.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
 > index 095eb14..dedb32b 100644
 > --- a/package/genimage/genimage.hash
 > +++ b/package/genimage/genimage.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256	5a36b2c1387007c2d6535a722ee257a387d0913bddcf8a94d460e6acd4d01859	genimage-10.tar.xz
 > +sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz

Committed to next, thanks.

It would be great if you could send a followup patch adding a sha256
hash for the COPYING file.

-- 
Bye, Peter Korsgaard
