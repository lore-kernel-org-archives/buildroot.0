From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 17 Jul 2017 12:03:20 -0400
Subject: [Buildroot] [PATCHv2 2/3] qt5webengine: new package
In-Reply-To: <1499856552195-170662.post@n4.nabble.com>
References: <20170712021630.31121-1-gael.portay@savoirfairelinux.com>
 <20170712021630.31121-3-gael.portay@savoirfairelinux.com>
 <1499856552195-170662.post@n4.nabble.com>
Message-ID: <20170717160320.mmhtx7t7x52ucyva@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 12, 2017 at 03:49:12AM -0700, gomsis wrote:
> Error while compiling
> 
> root at C1VAD58:/home/bsm/Desktop/buildroot# patch -p1
> <PATCHv2-2-3-qt5webengine-new-package.patch
> patching file package/qt5/Config.in
> Hunk #1 succeeded at 78 with fuzz 1 (offset -1 lines).
> patching file package/qt5/qt5webengine/0001-change-default-ssl-dir.patch
> patching file package/qt5/qt5webengine/Config.in
> patching file package/qt5/qt5webengine/chromium.inc
> patching file package/qt5/qt5webengine/qt5webengine.hash
> patching file package/qt5/qt5webengine/qt5webengine.mk
> 
> root at C1VAD58:/home/bsm/Desktop/buildroot# make
> package/qt5/qt5webengine/chromium.inc:13: *** commands commence before first
> target.  Stop.
> root at C1VAD58:/home/bsm/Desktop/buildroot#
> 

My bad, I submitted the buggy version. I am resending a v3.

Thanks.
