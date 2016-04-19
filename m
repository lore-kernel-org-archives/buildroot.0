From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:20:48 +0200
Subject: [Buildroot] [ PATCH Selinux v11] linux-pam: add optional
 libselinux and audit dependencies
In-Reply-To: <1458128735-14925-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1458128735-14925-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160419232048.58f4359e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 17:15:35 +0530, Niranjan Reddy wrote:
> From: Niranjan <niranjan.reddy@rockwellcollins.com>
> 
> This patch adds optional libselinux and audit packages
> to linux-pam package.
> 
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> 
> ---
> Changes v10 -> v11:
>   - Removed host-linux-pam related config options as it is not related to this patch.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
