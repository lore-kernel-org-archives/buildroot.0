From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:26:57 +1300
Subject: [Buildroot] [PATCH 1/1] package/x265: Disable -march selection
 from CMakeLists.txt
In-Reply-To: <20170123200722.25942-1-bernd.kuhls@t-online.de>
References: <20170123200722.25942-1-bernd.kuhls@t-online.de>
Message-ID: <20170124182657.6f40be4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jan 2017 21:07:22 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/996/9961313a870b833b48438d8d258c5b5323025790/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x265/0001-fix-gcc-options.patch | 52 +++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/x265/0001-fix-gcc-options.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
