From: Richard Braun <rbraun@sceen.net>
Date: Sun, 30 Dec 2012 18:50:09 +0100
Subject: [Buildroot] Bootloader
In-Reply-To: <CAKvQZ_069zGz=-uY_uTP90ycd8+S9LBXiR_RuOUYrtZW4g3WEw@mail.gmail.com>
References: <CAKvQZ_069zGz=-uY_uTP90ycd8+S9LBXiR_RuOUYrtZW4g3WEw@mail.gmail.com>
Message-ID: <20121230175009.GA4412@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 30, 2012 at 06:18:39PM +0100, Willy Lambert wrote:
> The one I know the most is grub, but I need a "grub-install" phasis
> but no "host-tool" seems to be provided.

This problem is specific to the x86 architecture. I've posted a way to
work around this issue [1] some time ago, along with a template script
you can adjust to your needs [2]. If your host is an x86_64 machine, be
sure to install 32-bit versions of your main libraries (e.g. libc6-i386
on Debian Squeeze). Hope it helps.

-- 
Richard Braun

[1] http://lists.busybox.net/pipermail/buildroot/2012-August/057536.html
[2] http://lists.busybox.net/pipermail/buildroot/2012-August/057538.html
