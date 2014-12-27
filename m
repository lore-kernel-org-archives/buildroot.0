From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:28:47 +0100
Subject: [Buildroot] [PATCH] package/libiio: do not force shared object
 build
In-Reply-To: <1419696948-31721-1-git-send-email-s.martin49@gmail.com>
References: <1419696948-31721-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141227172847.2f547b3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 27 Dec 2014 17:15:48 +0100, Samuel Martin wrote:
> libiio correctly builds as a static library, there is no obvious reason
> to force the shared object build.
> 
> So, let the CMake BUILD_SHARED_LIBS variable handles the type of library
> built.
> 
> This libiio patch has already been submitted upstream:
>   https://github.com/analogdevicesinc/libiio/pull/6
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...UILD_SHARED_LIBS-drive-the-type-of-librar.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
