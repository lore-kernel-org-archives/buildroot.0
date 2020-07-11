From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 23:52:21 +0200
Subject: [Buildroot] [PATCH] package/vsftpd: add systemd init
In-Reply-To: <20200711135843.1789746-1-francois.perrad@gadz.org>
References: <20200711135843.1789746-1-francois.perrad@gadz.org>
Message-ID: <20200711235221.6c886519@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 15:58:43 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/vsftpd/vsftpd.mk      |  5 +++++
>  package/vsftpd/vsftpd.service | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/vsftpd/vsftpd.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
