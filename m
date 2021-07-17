From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:03:48 +0200
Subject: [Buildroot] [PATCH v3] package/qt5/qt5base: fix build with gcc
 11
In-Reply-To: <20210706042902.6483-1-fido_max@inbox.ru>
References: <20210706042902.6483-1-fido_max@inbox.ru>
Message-ID: <20210717100348.4b734aca@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue,  6 Jul 2021 07:29:02 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Fix the following build failure with gcc 11:
> 
> text/qbytearraymatcher.h:103:38: error: 'numeric_limits' is not a member of 'std'
>   103 |         const auto uchar_max = (std::numeric_limits<uchar>::max)();
>       |                                      ^~~~~~~~~~~~~~
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - Removed "Tested-by" from 0007-Build-fixes-for-GCC-11.patch

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
