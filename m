From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Oct 2017 23:28:26 -0400
Subject: [Buildroot] [PATCH 03/12] docker-engine: add support for init
	processes
In-Reply-To: <20171021135139.GC7022@scaer>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-3-christian@paral.in>
 <20171021135139.GC7022@scaer>
Message-ID: <CA+h8R2qE-PFjsD-06TC0CXQu2Q0ivJw8cgnXaaiQik_V3HHs5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

On Sat, Oct 21, 2017, 9:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Why not:
>
>     $(if $(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),\
>         ln -fs $(DOCKER_ENGINE_INIT) $(TARGET_DIR)/usr/bin/docker-init
>     )

That would work too.

Best,
Christian
