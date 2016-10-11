From: Matt Kraai <kraai@ftbfs.org>
Date: Tue, 11 Oct 2016 04:35:16 -0700
Subject: [Buildroot] [PATCH] qt53d,
 qt5serialbus: move to technology preview section
In-Reply-To: <20161011112640.3005e46c@free-electrons.com>
References: <20161011024600.4939-1-kraai@ftbfs.org>
 <20161011112640.3005e46c@free-electrons.com>
Message-ID: <20161011113516.e2esmwwos7yzg7sp@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Oct 11, 2016 at 11:26:40AM +0200, Thomas Petazzoni wrote:
> On Mon, 10 Oct 2016 19:46:00 -0700, Matt Kraai wrote:
> > Signed-off-by: Matt Kraai <kraai@ftbfs.org>
> 
> qt5serialbus is indeed a "technology preview" in Qt 5.6, but I believe
> qt3d was a technology preview in Qt 5.5, but then promoted as an
> integral part of Qt as of Qt 5.6.
> 
> Do you have a source of information to confirm what your patch is doing?

Yes, I based this on

 https://wiki.qt.io/New_Features_in_Qt_5.6#Technology_Preview_Modules

That section includes

* Qt 3D
* Qt Quick Controls 2.0
* Qt SerialBus

-- 
Matt                                           https://ftbfs.org/~kraai/
