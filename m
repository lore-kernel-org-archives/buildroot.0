From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:46:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: bump version to 3.4.1
In-Reply-To: <20171218062911.14366-1-bernd.kuhls@t-online.de>
References: <20171218062911.14366-1-bernd.kuhls@t-online.de>
Message-ID: <20171218104649.17be37bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 07:29:10 +0100, Bernd Kuhls wrote:
> Configure options for libnut & libschroedinger were removed:
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=a3deeaade32db5a1b736b8d3365e52254f3fa6ac
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=220b24c7c97dc033ceab1510549f66d0e7b52ef1
> 
> Upstream now prefers NASM assembler over YASM:
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=4f9297ac3b39098547863d28fbc8d2a906d5be49
> 
> Added configure options for alsa support:
> http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=b447629093d75f18d0a8fc44ec768022322b2182
> 
> Added configure options for libiconv:
> http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=fe9c85e4e2650dc9537b54b1eabb4f9be7b628ed
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Duplicate SoB line.

> 
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.hash |  5 ++++-
>  package/ffmpeg/ffmpeg.mk   | 22 +++++++++++++++-------
>  2 files changed, 19 insertions(+), 8 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
