From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 16:03:24 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/cups-filters: fix build without dejavu font
In-Reply-To: <CAPi7W80Xhbo9DWmTbY+5ykMF068HFCiXOQMEfmZzVHj+Y_nwuQ@mail.gmail.com>
References: <20200714112308.3264764-1-fontaine.fabrice@gmail.com>
 <20200714144735.56a11bb9@windsurf.home>
 <CAPi7W81nhSFN09_=mR2g8A5kHL1vHzYCzCjarZWWtrAMEDvLCA@mail.gmail.com>
 <20200714154922.0bad332b@windsurf.home>
 <CAPi7W80Xhbo9DWmTbY+5ykMF068HFCiXOQMEfmZzVHj+Y_nwuQ@mail.gmail.com>
Message-ID: <20200714160324.41f608f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 15:55:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I think it would be better to not hardcode any path at all, so perhaps
> > Yann's suggestion of using /dev/null is a good option here.  
> Then I'll send a new pull request upstream that replaces "test -f" by
> "test -e" because /dev/null is not a regular file.

Well, the patch that you have accepted anyway disables the check when
cross_compiling=yes, so we should be good, no?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
