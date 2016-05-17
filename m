From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:51:07 +0200
Subject: [Buildroot] [PATCH v3 6/9] python-pygame: bump version to fix
 Python 3 byte-compilation issue
In-Reply-To: <1462133720-409-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160517225107.4fff6c95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 22:15:17 +0200, Thomas Petazzoni wrote:
> The current version of python-pygame in Buildroot does not
> byte-compile properly with Python 3. Commit 22efec0b44da from upstream
> fixes the problem, so we take this opportunity to bump the pygame
> version.
> 
> Fixing byte-compilation is necessary as we will soon enable a
> mechanism that aborts the build in case of error during the
> byte-compilation process (while they are today considered as
> warnings).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python-pygame/python-pygame.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I've amended the commit log to indicate why we're disabling the
freetype support, and I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
