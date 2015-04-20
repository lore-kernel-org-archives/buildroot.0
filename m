From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 20 Apr 2015 17:45:49 +0200
Subject: [Buildroot] [PATCH 2/3] python-pyqt: fix install
In-Reply-To: <20150420173752.153476a6@free-electrons.com>
References: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
 <1429543759-32207-2-git-send-email-gwenj@trabucayre.com>
 <20150420173752.153476a6@free-electrons.com>
Message-ID: <20150420174549.5033a947@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, 20 Apr 2015 17:37:52 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Mon, 20 Apr 2015 17:29:18 +0200, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > PyQt4 provides two version for some py files: one for python2.x and one for
> > python3.x. This two versions are installed in TARGET_DIR.
> > After installing files, python is used to generate all .pyc files, but fails
> > like :
> > class ProxyBase(metaclass=ProxyMetaclass):
> >                              ^
> > 							 SyntaxError: invalid syntax
> 
> I did not encounter this issue when testing. With which configuration
> do you get this problem?
> 
I have used the defconfig provided by :
http://autobuild.buildroot.net/results/e2a/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/

> Thanks,
> 
> Thomas

Regards,
Gwen
