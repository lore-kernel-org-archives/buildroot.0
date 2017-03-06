From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:14:38 +0100
Subject: [Buildroot] [PATCH] package/python-pyliftdi: fix patch
In-Reply-To: <1488820643-21912-1-git-send-email-yann.morin.1998@free.fr>
References: <1488820643-21912-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170306211438.73155a77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 18:17:23 +0100, Yann E. MORIN wrote:
> The 0001 patch introduces leading tabs, when the rest of the file is
> using leading spaces, and python3 does not like that.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/e24/e24a8e6f62139ab0efbce7a32c3d88c2cba839c6/
>     http://autobuild.buildroot.org/results/7b1/7b14c4bb4cac3ff006e77330cbd7b839ad80192a/
>     http://autobuild.buildroot.org/results/67c/67cddfdb801e83acfd9f197f5661fd43fa38a092/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Christian Kellermann <christian.kellermann@solectrix.de>
> ---
>  package/python-pylibftdi/0001-do-not-use-find-library.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.... and I missed the typo you did in the
commit title :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
