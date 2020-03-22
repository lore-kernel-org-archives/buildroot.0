From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:14:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix build without C++
In-Reply-To: <20200310201305.110543-1-fontaine.fabrice@gmail.com>
References: <20200310201305.110543-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322221403.03bc3826@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 21:13:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 02bd5eb59ff113203ea60ffee68bfdbacc4c9245 wrongly removed
> avahi_cv_sys_cxx_works=yes as a result, build fails without C++
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3d3596ad386144609549693c0a1aa9b704ba748c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/avahi/avahi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
