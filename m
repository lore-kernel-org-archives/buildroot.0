From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:29:15 +0100
Subject: [Buildroot] [PATCH v6 8/9] python-pyqt5: Depend directly on Qt5
 rather than its toolchain requirements
In-Reply-To: <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170201222915.58e4f805@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jan 2017 08:59:10 +0100, Zoltan Gyarmati wrote:
> From: Naumann Andreas <ANaumann@ultratronik.de>
> 
>  When pyqt5 is used it's obvious that qt5 needs to be selected and configured
> by the user, hence we enforce it by making pyqt5 depending on qt5, rather than
> selecting it and depending only on the qt5 requirements.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

The previous version of this patch series from Andreas was doing this
change for both python-pyqt and python-pyqt5. But in your new version,
you have removed Andreas patch making the change to python-pyqt, and
only kept the python-pyqt5 change. Why? Due to this, the handling of
python-pyqt would no longer be consistent with the one of python-pyqt5.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
