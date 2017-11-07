From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:41:51 +0100
Subject: [Buildroot] [git commit] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <1510080818847-0.post@n4.nabble.com>
References: <20171106173439.E5B41810DB@busybox.osuosl.org>
 <1510080818847-0.post@n4.nabble.com>
Message-ID: <20171107224151.3ab12019@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 11:53:38 -0700 (MST), Giulio Benetti wrote:
> Hi Peter,
> 
> unfortunately it doesn't work.
> The problem is that you can't put at the end of file
> EGLFS_DEVICE_INTEGRATION = eglfs_viv
> It must stay before:
> 
> include(../common/linux_device_post.conf)
> load(qt_config)
> 
> I did the same for eglfs_mali and failed,
> so I've retried putting it there, and it works.

Adding Gary Bisson in Cc. Gary, what do you think about the above
report?

Thanks!

Thomasa
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
