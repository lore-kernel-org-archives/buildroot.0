From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:06:09 +0100
Subject: [Buildroot] [PATCH] ffmpeg: disable on Microblaze
In-Reply-To: <1478359433-28319-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478359433-28319-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161107230609.5686ce8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 16:23:53 +0100, Thomas Petazzoni wrote:
> Building ffmpeg on Microblaze triggers the gcc PR71124, which causes
> an infinite loop in the compiler. This causes numerous timeouts in the
> autobuilders, such as, just over the last two days:
> 
> http://autobuild.buildroot.net/results/b47fb2ae810ada475fef215c1efb54a9891fef6f
> http://autobuild.buildroot.net/results/a8a1dfb7d4a7a6babe665214030e2245d572d1d3
> http://autobuild.buildroot.net/results/248c58cd20686497c4dabc1a19b2c8c7c76b33ab
> http://autobuild.buildroot.net/results/3641092f62551bd41c24eafdce46804f9551b761
> http://autobuild.buildroot.net/results/f2f65106c3e9dcfd546d5dad7cd0f7cd7145420c
> http://autobuild.buildroot.net/results/c45f085ca421b12195fe6a9298b3b3a9cb761360
> http://autobuild.buildroot.net/results/349de9b8251b9b72ace595920303e45497833c29
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ffmpeg/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
