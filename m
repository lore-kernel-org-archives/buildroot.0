From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:32:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/radvd: fix musl build
In-Reply-To: <1453592805-20348-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453592805-20348-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126223245.530d7390@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 00:46:45 +0100, Bernd Kuhls wrote:
> he autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build using
> the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/radvd/0001-musl-libc-fix.patch | 95 ++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 package/radvd/0001-musl-libc-fix.patch

I've applied, but instead of including the patch, I simply used
RADVD_PATCH and pointed to the upstream Github commit. This is better
as it clearly indicates that the commit is upstream, the commit ID,
etc. This will makes things easier when bumping the package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
