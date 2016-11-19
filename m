From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 11:08:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/udisks: fix daemon path in
 systemd service file
In-Reply-To: <1479401660-23073-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1479401660-23073-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20161119110854.1e34352f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 17:54:20 +0100, Pieterjan Camerlynck wrote:
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  package/udisks/0002-Fix-systemd-service-file.patch | 37 ++++++++++++++++++++++
>  package/udisks/udisks.mk                           |  2 ++
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/udisks/0002-Fix-systemd-service-file.patch

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
