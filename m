From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 17:59:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: fix build with gcc6
In-Reply-To: <20161225184952.21549-1-bernd.kuhls@t-online.de>
References: <20161225184952.21549-1-bernd.kuhls@t-online.de>
Message-ID: <20161227175950.5851e23f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Dec 2016 19:49:52 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/b99/b997c2b6307deb48a42e9b317715a00b65f90149/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sdl2/0002-gcc6.patch | 64 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/sdl2/0002-gcc6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
