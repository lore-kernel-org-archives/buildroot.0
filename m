From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:30:05 +0100
Subject: [Buildroot] [PATCH 3/6] qt: remove broken iBase driver
In-Reply-To: <trinity-f8215723-32a4-44fc-8031-333c19751e54-1488957559946@3capp-gmx-bs66>
References: <20170307235054.25149-1-arnout@mind.be>
 <20170307235054.25149-3-arnout@mind.be>
 <trinity-f8215723-32a4-44fc-8031-333c19751e54-1488957559946@3capp-gmx-bs66>
Message-ID: <20170309223005.3754bb93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Mar 2017 08:19:19 +0100, Peter Seiderer wrote:

> Missing some code deletion from package/qt/qt.mk file:
> 
> ifeq ($(BR2_PACKAGE_QT_IBASE),y)
> QT_CONFIGURE_OPTS += -qt-sql-ibase
> endif

Well spotted, I've tweaked Arnout's patch when applying to remove this
part of the code. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
