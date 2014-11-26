From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:26:26 +0100
Subject: [Buildroot] [PATCH v2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <CA+sos78yM1jSbH4tfFeOnGisghNXyW_WT+q1d+ufBACtywcx0Q@mail.gmail.com>
References: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CA+sos78yM1jSbH4tfFeOnGisghNXyW_WT+q1d+ufBACtywcx0Q@mail.gmail.com>
Message-ID: <20141126222626.153cd8ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 26 Nov 2014 01:09:24 +0100, Beno?t Th?baudeau wrote:

> Note that the winbindd daemon is still not started by S91smb if
> BR2_PACKAGE_SAMBA_WINBINDD is set.

Patches welcome! It could be a separate init script, though.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
