From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 17:17:11 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <CAHXCMMJgpbTstcZyUOnz2dsAFpWvZNhGgSdHggPNfHfR3tMPjA@mail.gmail.com>
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMJgpbTstcZyUOnz2dsAFpWvZNhGgSdHggPNfHfR3tMPjA@mail.gmail.com>
Message-ID: <20130529171711.412e5b4c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 29 May 2013 16:56:47 +0200, Samuel Martin wrote:

> I've run few builds (same config, with all or no modules selected,
> with/without this patch applied):
> -rw-r--r-- 1 sam sam 64M May 29 12:39
> br-output/python-without-patch/images/rootfs.tar
> -rw-r--r-- 1 sam sam 29M May 29 12:50
> br-output/python-with-patch-v3-no-modules/images/rootfs.tar
> -rw-r--r-- 1 sam sam 32M May 29 12:49
> br-output/python-with-patch-v3-all-modules/images/rootfs.tar

I would have expected this 32M to be much closer to the 64M. Normally,
with all modules enabled, we should have the same size as the Python
interpreter without Maxime's patch.

Or am I missing something?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
