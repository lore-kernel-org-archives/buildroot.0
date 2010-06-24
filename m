From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 09:25:58 +0200
Subject: [Buildroot] Question concerning buildroot-libtool.patch
In-Reply-To: <201006240057.46368.PeterHuewe@gmx.de>
References: <201006240057.46368.PeterHuewe@gmx.de>
Message-ID: <20100624092558.428c8478@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Jun 2010 00:57:46 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> It used to work with an older version of Buildroot (~ git 2010-05-14) - but as 
> far as I can see nothing has changed on the patch / or the pidgin source I've 
> used.

I don't see how it's possible that the same patch doesn't apply on the
same codebase as before. Our buildroot-libtool.patch hasn't changed for
years. Something must have changed somewhere :)

> Any ideas how I can fix this? Unfortunately I'm not that into the whole 
> buildroot system (yet, but I'd like to learn and contribute to it).

You can use

<pkg>_LIBTOOL_PATCH=NO to disable the buildroot-libtool.patch on this
specific <pkg>.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
