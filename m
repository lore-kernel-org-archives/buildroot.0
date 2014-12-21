From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:04:40 +0100
Subject: [Buildroot] [PATCH v4 2/2] python-cheetah: add new package
In-Reply-To: <1419175615-13068-2-git-send-email-gwenj@trabucayre.com>
References: <1419175615-13068-1-git-send-email-gwenj@trabucayre.com>
 <1419175615-13068-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20141221220440.2d761e60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sun, 21 Dec 2014 16:26:55 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

I was a bit scared to see that this thing is not maintained since 2010,
but oh well, if you're using it :-)

I've applied your patch, after doing some changes:

    [Thomas:
     - Remove dependency on host-python-markdown, apparently not needed
       (it builds fine in a minimal chroot, which doesn't have
       python-markdown installed)
     - Remove runtime dependency on markdown, I can run Cheetah basic
       examples without python-markdown installed.
     - Add dependency on Python 2 only, since it doesn't build for Python
       3.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
