From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 17 Dec 2013 11:52:29 -0600
Subject: [Buildroot] [ PATCH v4 17/20] busybox: add option to enable
 SELinux support
In-Reply-To: <20131215171217.10575b07@skate>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>	<1386872840-22051-18-git-send-email-clshotwe@rockwellcollins.com>
 <20131215171217.10575b07@skate>
Message-ID: <OF939DED94.69B2A63C-ON86257C44.0061BBBC-86257C44.00622C0A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> > +config BR2_PACKAGE_BUSYBOX_SELINUX
> > +   bool "Enable SELinux support"
> 
> Maybe we don't need a Busybox sub-option and instead we can enable
> SELinux support as soon as libselinux and libsepol are available?
> 

Either way works for me.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
