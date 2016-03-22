From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 09:57:33 +0100
Subject: [Buildroot] [PATCH] dt: add patch to fix failures on newer
 toolchains
In-Reply-To: <1458561364-941-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1458561364-941-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160322095733.3ee5e8ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 08:56:04 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> On newer toolchains (glibc >= 2.20) _BSD_SOURCE behaviour was deprecated
> in favour if the _DEFAULT_SOURCE macro. See man 7 feature_test_macros.
> Add patch from Fedora to also consider _DEFAULT_SOURCE. Fixes:
> http://autobuild.buildroot.net/results/9e2/9e2126b0e68d0d59d37616a268adb810efd8281a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/dt/0002-dt-default-source-define.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/dt/0002-dt-default-source-define.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
