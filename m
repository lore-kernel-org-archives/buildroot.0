From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 14:06:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] freerdp: fix wayland client
 dependency chain failure
In-Reply-To: <20171125193305.9655-1-Adamduskett@outlook.com>
References: <20171125193305.9655-1-Adamduskett@outlook.com>
Message-ID: <20171126140604.6cae2157@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 14:33:05 -0500, Adam Duskett wrote:
> If the wayland client is selected, freerdp depends on libxkbcommon without
> depending on it in the mk file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Changed dependency logic (Yann)

Applied to master after changing the commit log as suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
