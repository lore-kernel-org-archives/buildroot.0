From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 15:53:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: fix build when host
 has no java support
In-Reply-To: <20170618072737.13591-1-bernd.kuhls@t-online.de>
References: <20170618072737.13591-1-bernd.kuhls@t-online.de>
Message-ID: <20170618155346.5418fa2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 09:27:37 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/630/630cfe62798d0f35fdfaed8547038ba7673cc149/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libbluray/libbluray.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
