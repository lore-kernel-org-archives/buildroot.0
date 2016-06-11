From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:06:58 +0200
Subject: [Buildroot] [PATCH] wayland: fix build on Blackfin
In-Reply-To: <1464271689-3879-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1464271689-3879-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160611160658.5bc28911@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 16:08:09 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to Wayland that allows the Blackfin
> architecture to build this package properly. The problem is due to the
> usual __USER_LABEL_PREFIX__ issue on Blackfin.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/e418b97766c943bf41fc80815c3e625e6a68b12d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...hitectures-with-non-empty-__USER_LABEL_PR.patch | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
