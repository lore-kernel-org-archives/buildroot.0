From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:22:38 +0100
Subject: [Buildroot] [PATCH] bind: Add systemd unit file and install it
 to run at startup.
In-Reply-To: <1420954296-27101-3-git-send-email-nroach44@gmail.com>
References: <1420954296-27101-1-git-send-email-nroach44@gmail.com>
 <1420954296-27101-3-git-send-email-nroach44@gmail.com>
Message-ID: <20150112222238.463e732b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Sun, 11 Jan 2015 13:31:36 +0800, Nathaniel Roach wrote:
> The unit file is taken from debian, but tested working.
> We'll call it named.service to match the sysV initscript.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/bind/bind.mk       |  9 +++++++++
>  package/bind/named.service | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 package/bind/named.service

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
