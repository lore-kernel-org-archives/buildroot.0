From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:13:29 +0200
Subject: [Buildroot] [PATCH] cryptsetup: remove e2fsprogs dependency
In-Reply-To: <7f547c8d1d6955c19526f5dfbf98ea12b2850e7c.1435843124.git.baruch@tkos.co.il>
References: <7f547c8d1d6955c19526f5dfbf98ea12b2850e7c.1435843124.git.baruch@tkos.co.il>
Message-ID: <20150704141329.7d451e37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  2 Jul 2015 16:18:44 +0300, Baruch Siach wrote:
> cryptsetup does not actually depend on e2fsprogs, but on libuuid that is a
> dependency of e2fsprogs. Remove the e2fsprogs dependency, and add a direct
> dependency on util-linux (libuuid provider).
> 
> Cc: Martin Hicks <mort@bork.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/cryptsetup/Config.in     | 5 +++--
>  package/cryptsetup/cryptsetup.mk | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
