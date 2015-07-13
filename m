From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 23:25:45 +0200
Subject: [Buildroot] [PATCH 17/38] netplug: systemd support
In-Reply-To: <d4fa793b4ff869a339f725d0b9e45924af6867e5.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <d4fa793b4ff869a339f725d0b9e45924af6867e5.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150713232545.29f532d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:05:57 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/netplug/netplug.mk      |  8 ++++++++
>  package/netplug/netplug.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/netplug/netplug.service

Applied after changing the patch to use a relative symlink rather than
an absolute one. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
