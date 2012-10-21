From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Oct 2012 20:20:58 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
 configuration.
In-Reply-To: <CAHXCMM+qPKy0qUefqnr3V5jiy7ffR1AO_aNnKiW7LBT_YfV01Q@mail.gmail.com>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-2-git-send-email-arnout@mind.be>
 <CAHXCMM+qPKy0qUefqnr3V5jiy7ffR1AO_aNnKiW7LBT_YfV01Q@mail.gmail.com>
Message-ID: <20121021202058.796a7f89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Oct 2012 17:05:40 +0200, Samuel Martin wrote:
> > +   (as far as they are relevant):
> > +   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
> > +   * +BR2_PACKAGE_BUSYBOX_CONFIG+
> > +   * +BR2_TOOLCHAIN_CTNG_CONFIG+
> > +   * +BR2_UCLIBC_CONFIG+
> > +   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
> I think that we could/should/have to add such option for barebox too.
> I've cooked a patch for that and I'll post it shortly.

My colleague Maxime has already posted such a patch a few days ago:

  http://lists.busybox.net/pipermail/buildroot/2012-October/060102.html

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
