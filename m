From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 12:48:28 -0300
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: add
 --enable-libdrm for udev
In-Reply-To: <20150331174702.4c82e8bd@free-electrons.com>
References: <1427815493-27954-1-git-send-email-gustavo@zacarias.com.ar>
 <20150331174702.4c82e8bd@free-electrons.com>
Message-ID: <551AC1CC.3070500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/2015 12:47 PM, Thomas Petazzoni wrote:

> Shouldn't this...
> 
>>  # udev kms support depends on libdrm
>>  ifeq ($(BR2_PACKAGE_LIBDRM),y)
>>  XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
> 
> be in this if condition, to make sure libdrm is indeed available?

Oh yes, fixing too many things at once ;)
I'll send v2.
Regards.
