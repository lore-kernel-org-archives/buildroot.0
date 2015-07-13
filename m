From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:18:21 +0200
Subject: [Buildroot] [PATCH 02/38] chrony: systemd support
In-Reply-To: <34254cc0f199ed486318f4274d9276e7149a93bd.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <34254cc0f199ed486318f4274d9276e7149a93bd.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150713181821.1b157e8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:02:24 +0300, Alex Suykov wrote:
> systemd has its own NTP daemon, which must be disabled before
> starting chrony. Possible (but unlikely) conflict with openntpd
> is not marked in either package.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/chrony/chrony.mk      |  8 ++++++++
>  package/chrony/chrony.service | 11 +++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/chrony/chrony.service

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
