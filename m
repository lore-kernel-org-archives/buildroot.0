From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 15 Dec 2011 16:08:51 +0100
Subject: [Buildroot] [PATCH] Rework of shutdown policy in inittab
In-Reply-To: <CBA0E7E1478449AB9BEC88E21C18E508@JohanW7>
References: <CBA0E7E1478449AB9BEC88E21C18E508@JohanW7>
Message-ID: <CAAXf6LWfW+Ut0Xr+uLfa6+b88AaOo7QcGy+tsZAwLQK5YZpi4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 15, 2011 at 2:21 PM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Hi
>
>
>
> I think for the majority of embedded systems? the shutdown is performed by
> pulling the plug?.

That really depends on the type of system.
Note also that the shutdown script is not only used for a real
shutdown, but also for a reboot.
