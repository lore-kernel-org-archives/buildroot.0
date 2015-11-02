From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 21:35:01 +0100
Subject: [Buildroot] [PATCH 1/1] mosquitto: systemd support
In-Reply-To: <1446326837-15874-1-git-send-email-gabe@hashrabbit.co>
References: <1446326837-15874-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <20151102213501.413e1457@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Sat, 31 Oct 2015 21:27:17 +0000, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/mosquitto/mosquitto.mk      |  8 ++++++++
>  package/mosquitto/mosquitto.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/mosquitto/mosquitto.service

I don't fully understand the systemd thing, but this looked reasonable,
so I've applied. Systemd people in the Buildroot community are invited
to comment/review a bit more on systemd related things :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
