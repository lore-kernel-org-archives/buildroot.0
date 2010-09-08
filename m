From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Sep 2010 12:29:51 +0200
Subject: [Buildroot] Qt QtUiTools
In-Reply-To: <AANLkTinS00d+cpiORtAghjVRibz+_3K5Zh1mWBzPBLbw@mail.gmail.com>
References: <AANLkTinS00d+cpiORtAghjVRibz+_3K5Zh1mWBzPBLbw@mail.gmail.com>
Message-ID: <20100908122951.5b2f9761@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Sep 2010 09:58:50 +0100
mailing list <mailinglist@gatt.me> wrote:

> I've recently used the Qt build of buildroot and noticed that I
> couldn't use QUiLoader, I had to add "-make tools" to the configure
> line to compile the necessary libraries so that I could use these
> functions. I don't believe it affects the rootfs size (although I
> have to admit I didn't run a test), but the extra functionality gets
> compiled into the executable if i understand it correctly. It will
> however increase build time. No other libraries require copying
> across.
> 
> I was wondering if it would be worth adding this as an option to
> menuconfig so that it can be built if required.

I don't know what QtUiTools are, but if it's useful for you, it's
probably useful for others as well. So, yes, having this as a
menuconfig option makes sense.

Could you submit a patch that implements this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
