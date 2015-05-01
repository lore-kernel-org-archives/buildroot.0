From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:17:30 +0200
Subject: [Buildroot] [PATCH v2] freerdp: fix build with uclibc snapshot
 and uclibc-ng
In-Reply-To: <f32b411ce05373bca0ae48db848f28ab5acafb62.1430451363.git.baruch@tkos.co.il>
References: <f32b411ce05373bca0ae48db848f28ab5acafb62.1430451363.git.baruch@tkos.co.il>
Message-ID: <20150501101730.457d4126@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri,  1 May 2015 06:36:03 +0300, Baruch Siach wrote:
> uclibc snapshot and uclibc-ng add support for the eventfd_{read,write} glibc
> extensions. Refine our uClibc support patch to take this into account, based
> on upstream fix applied to freerdp master branch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e6c/e6c2ac69682f409f9ee78a3a6155ae356c3368a4/
> http://autobuild.buildroot.net/results/558/558ccb0e475bfb434685c580d86f6c634238a084/
> http://autobuild.buildroot.net/results/249/24901b2dfc92b516f74054ea7bb71e1ccfc3f12f/
> 
> and many more.
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    Fix is now upstream
>    Adopt upstream change s/WITH_EVENTFD_GLIBC_EXT/WITH_EVENTFD_READ_WRITE/
> ---
>  package/freerdp/0001-add-support-for-uclibc.patch | 48 +++++++++++++++++++----
>  1 file changed, 41 insertions(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
