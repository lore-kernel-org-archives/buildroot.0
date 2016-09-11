From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:54:31 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <20160909163708.31980-1-james.knight@rockwellcollins.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
Message-ID: <20160911155431.6204c127@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 12:37:08 -0400, James Knight wrote:
> The provided switches from the RPM5 implementation to rpm.org's stream.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Could you give some details on why the rpm.org version is better than
the rpm5.org version? The motivation to move from a 5.x version to
a 4.x version doesn't look immediately obvious, so some more
details would be good to have.

RPM seems like a weird project, it's widely used, but it's very hard to
understand what is the real upstream for it. This fact was even
discussed on LWN recently: https://lwn.net/Articles/196523/.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
