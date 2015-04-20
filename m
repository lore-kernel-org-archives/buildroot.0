From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 17:37:52 +0200
Subject: [Buildroot] [PATCH 2/3] python-pyqt: fix install
In-Reply-To: <1429543759-32207-2-git-send-email-gwenj@trabucayre.com>
References: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
 <1429543759-32207-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150420173752.153476a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Mon, 20 Apr 2015 17:29:18 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> PyQt4 provides two version for some py files: one for python2.x and one for
> python3.x. This two versions are installed in TARGET_DIR.
> After installing files, python is used to generate all .pyc files, but fails
> like :
> class ProxyBase(metaclass=ProxyMetaclass):
>                              ^
> 							 SyntaxError: invalid syntax

I did not encounter this issue when testing. With which configuration
do you get this problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
