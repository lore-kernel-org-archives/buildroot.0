From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:54:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: fix download URL
In-Reply-To: <20170528204057.28697-1-bernd.kuhls@t-online.de>
References: <20170528204057.28697-1-bernd.kuhls@t-online.de>
Message-ID: <20170529215415.39d9e8a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 22:40:57 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libev/libev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Could you contact the upstream developer to
ask him to stop moving the tarballs around? It is really annoying that
the latest version is available in http://dist.schmorp.de/libev/, and
then gets moved to http://dist.schmorp.de/libev/Attic/ as soon as a
newer version is released.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
