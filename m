From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2017 12:00:42 +0100
Subject: [Buildroot] [PATCH v6 8/9] python-pyqt5: Depend directly on Qt5
 rather than its toolchain requirements
In-Reply-To: <38d15b3f-1032-4cda-b73e-9489c8a11806@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170201222915.58e4f805@free-electrons.com>
 <38d15b3f-1032-4cda-b73e-9489c8a11806@gmail.com>
Message-ID: <20170202120042.2c0562da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Feb 2017 09:57:57 +0100, Zoltan Gyarmati wrote:

> Ah, i was focusing on the qt5 related things, but you are right, it
> should be consistent, i'll add it back, thanks for noting this. Did you
> find any other flaw in the series?

I haven't looked very precisely at the rest of the series yet, so I
don't have other comments. I think the review from Peter Seiderer is
actually the most important one, so I'll wait for Peter to have a
look :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
