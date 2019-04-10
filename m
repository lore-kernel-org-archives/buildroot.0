From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Apr 2019 20:32:18 +0200
Subject: [Buildroot] [git commit] package/xz: update license
In-Reply-To: <20190410165854.7E8F6836D9@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 10 Apr 2019 19:02:51 +0200")
References: <20190410165854.7E8F6836D9@busybox.osuosl.org>
Message-ID: <87v9zlr9sd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=dc9b97ab6cf0a3ee57b25fa6cb88dcbc70393ac9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > - Add COPYING to license files as it gives useful info on license
 > - Add "Public Domain" to XZ_LICENSE (see COPYING)
 > - Add hash for license files

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/xz/xz.hash | 6 ++++++
 >  package/xz/xz.mk   | 4 ++--
 >  2 files changed, 8 insertions(+), 2 deletions(-)

 > diff --git a/package/xz/xz.hash b/package/xz/xz.hash
 > index 20a4a47432..28018c76c3 100644
 > --- a/package/xz/xz.hash
 > +++ b/package/xz/xz.hash
 > @@ -1,2 +1,8 @@
 >  # Locally calculated after checking pgp signature
 >  sha256 fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1  xz-5.2.3.tar.bz2
 > +
 > +#?Hash for license files

Hmm, that is not a normal space. Some strange unicode character?
Fabrice, care to fix?

-- 
Bye, Peter Korsgaard
