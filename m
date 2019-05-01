From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 09:23:43 +0200
Subject: [Buildroot] [PATCH 03/11] package/python-markupsafe: bump to
 version 1.1.1
In-Reply-To: <20190430131919.130128-4-aduskett@gmail.com>
 (aduskett@gmail.com's message of "Tue, 30 Apr 2019 09:19:11 -0400")
References: <20190430131919.130128-1-aduskett@gmail.com>
 <20190430131919.130128-4-aduskett@gmail.com>
Message-ID: <874l6ek58g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Also add hash for the license file.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 >  package/python-markupsafe/python-markupsafe.hash | 6 ++++--
 >  package/python-markupsafe/python-markupsafe.mk   | 6 +++---
 >  2 files changed, 7 insertions(+), 5 deletions(-)

 > diff --git a/package/python-markupsafe/python-markupsafe.hash
 > b/package/python-markupsafe/python-markupsafe.hash
 > index 4226a1ddf6..044d6d83a5 100644
 > --- a/package/python-markupsafe/python-markupsafe.hash
 > +++ b/package/python-markupsafe/python-markupsafe.hash
 > @@ -1,3 +1,5 @@
 >  # md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
 > -md5	2fcedc9284d50e577b5192e8e3578355  MarkupSafe-1.0.tar.gz
 > -sha256	a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665  MarkupSafe-1.0.tar.gz
 > +md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
 > +sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
 > +sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
 > +

check-package complains:

Applying: package/python-markupsafe: bump to version 1.1.1
package/python-markupsafe/python-markupsafe.hash:5: empty line at end of file
20 lines processed
1 warnings generated

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
