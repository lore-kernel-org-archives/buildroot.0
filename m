From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:10:08 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/stella: bump version to
 4.7.3
In-Reply-To: <20170529191429.11102-2-bernd.kuhls@t-online.de>
References: <20170529191429.11102-1-bernd.kuhls@t-online.de>
 <20170529191429.11102-2-bernd.kuhls@t-online.de>
Message-ID: <20170606231008.278b3892@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 21:14:29 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://github.com/stella-emu/stella/commit/be2f6f5b64266f4d68af6a2236bd4b59a7e6638d
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...gnu-11-standard-to-prevent-errors-on-PPC.patch} |  0
>  ...figure-Add-CXXFLAGS-for-test-compilations.patch | 44 ----------------------
>  package/stella/stella.hash                         |  2 +-
>  package/stella/stella.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 46 deletions(-)
>  rename package/stella/{0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch => 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch} (100%)
>  delete mode 100644 package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
