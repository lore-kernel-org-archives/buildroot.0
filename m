From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:39:19 +0200
Subject: [Buildroot] [PATCH v2] libdrm: add vc4 (Raspberry Pi) option
In-Reply-To: <1456440522-18652-1-git-send-email-ps.report@gmx.net>
References: <1456440522-18652-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160331183919.63657b3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 23:48:42 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - rebased on next branch (and droped duplicate version bump patch)
>     (suggested by Peter Korsgaard)
>   - fix typo '((' in commit message
> ---
>  package/libdrm/Config.in | 6 ++++++
>  package/libdrm/libdrm.mk | 6 ++++++
>  2 files changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
