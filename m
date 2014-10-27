From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:28:39 +0100
Subject: [Buildroot] [PATCH 1/8] dbus: drop user/group from skeleton
In-Reply-To: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141027192839.324c625b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 27 Oct 2014 15:18:54 -0300, Gustavo Zacarias wrote:
> It belongs to the package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dbus/dbus.mk       | 4 ++++
>  system/skeleton/etc/group  | 1 -
>  system/skeleton/etc/passwd | 1 -
>  3 files changed, 4 insertions(+), 2 deletions(-)

All 8 patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
