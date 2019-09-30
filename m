From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 23:25:10 +0200
Subject: [Buildroot] [PATCH 10/10] package/mdevd: bump version to 0.1.1.0
In-Reply-To: <20190930225757.44578f50@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 30 Sep 2019 22:57:57 +0200")
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
 <20190929171017.26831-11-eric.le.bihan.dev@free.fr>
 <20190930225757.44578f50@windsurf.home>
Message-ID: <87wodp1npl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 29 Sep 2019 19:10:17 +0200
 > Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

 >> This new package provides mdevd, a small daemon managing kernel hotplug
 >> events similar to udevd.
 >> 
 >> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

 > We have a choice between static /dev, devtmpfs, devtmpfs + Busybox
 > mdev, devtmpfs + eudev, should we add a choice of devtmpfs + mdevd ?

 > What happens if we have both Busybox mdev *and* mdevd in the same
 > configuration ?

What is the advantage of mdevd over mdev now that we use the daemon mode
of mdev?

-- 
Bye, Peter Korsgaard
