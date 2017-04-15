From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:45:40 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/efl: bump to version 1.19.0
In-Reply-To: <20170414211424.9283-1-romain.naour@gmail.com>
References: <20170414211424.9283-1-romain.naour@gmail.com>
Message-ID: <20170415104540.0d991d4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 23:14:22 +0200, Romain Naour wrote:
> This new version of the EFL enables systemd support by default, so
> we have to disable it explicitely for host-efl by adding an
> additional --disable-systemd option to HOST_EFL_CONF_OPTS.
> 
> Also handle newly introduced options vnc-server and net-control
> which brings additional dependencies. Disable them by default.
> 
> Select wayland-protocol package which is now required to build
> the efl wayland support [1].
> 
> See the release announcement [2].
> 
> [1] https://git.enlightenment.org/core/efl.git/commit/?id=55750d41fad6055a549664ae92a34e636d7fb1f0
> [2] https://sourceforge.net/p/enlightenment/mailman/message/35785467
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: improve commit log (ThomasP)
> ---
>  package/efl/Config.in |  1 +
>  package/efl/efl.hash  |  4 ++--
>  package/efl/efl.mk    | 14 ++++++++++++--
>  3 files changed, 15 insertions(+), 4 deletions(-)

Thanks for this new iteration. All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
