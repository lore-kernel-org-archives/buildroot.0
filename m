From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:24:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix build with
 threads disabled
In-Reply-To: <20171111164153.9587-1-bernd.kuhls@t-online.de>
References: <20171111164153.9587-1-bernd.kuhls@t-online.de>
Message-ID: <20171111232458.37b83c4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Nov 2017 17:41:53 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/f16/f16a558c30199a92e93a31e0ba391b99a9bd689f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openjpeg/openjpeg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
