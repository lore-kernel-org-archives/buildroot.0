From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:53:08 +0200
Subject: [Buildroot] [PATCH 5/5] package/systemd: disable portabled
In-Reply-To: <20200731215345.19212-6-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-6-nolange79@gmail.com>
Message-ID: <20200805155308.268cac52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:53:45 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> portabled is a container-like service, but so far its
> still a preview and basically unknown as the portablectl
> is hidden in /usr/lib/systemd.
> 
> Disable it for now.
> 
> See https://systemd.io/PORTABLE_SERVICES/
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
