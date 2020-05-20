From: Michael Walle <michael@walle.cc>
Date: Wed, 20 May 2020 08:26:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <20200520051647.18530-1-heiko.thiery@gmail.com>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
Message-ID: <c9560f8239752eb2ea3c23a35e41ca85@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-05-20 07:16, schrieb Heiko Thiery:
> Interface configuration is hard coded in the config file. This will
> throw an error when this interace (eth0) is not present.
> 
> This patch removes the interface to be used from the config and appends 
> it
> to the PTP4L_ARGS. With this the custom arguments can be set via
> /etc/defaults/ptp4l.
> 
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Michael Walle <michael@walle.cc>
