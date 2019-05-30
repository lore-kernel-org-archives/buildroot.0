From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:25:08 +0200
Subject: [Buildroot] [PATCH 07/19] package/fontconfig: add hash for
 license file
In-Reply-To: <20190529033537.128311-8-aduskett@gmail.com>
 (aduskett@gmail.com's message of "Tue, 28 May 2019 23:35:25 -0400")
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-8-aduskett@gmail.com>
Message-ID: <87v9xrzikb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 >  package/fontconfig/fontconfig.hash | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
 > index 5243c09615..153f00c3d8 100644
 > --- a/package/fontconfig/fontconfig.hash
 > +++ b/package/fontconfig/fontconfig.hash
 > @@ -1,2 +1,5 @@
 >  # From https://lists.freedesktop.org/archives/fontconfig/2018-August/006324.html
 >  sha256 f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741 fontconfig-2.13.1.tar.bz2
 > +
 > +# Locally calculated
 > +sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886 COPYING

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
