From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 May 2016 08:56:46 -0300
Subject: [Buildroot] [PATCH] package/samba4: create tempfile with systemd
In-Reply-To: <1463399550-4040-1-git-send-email-yann.morin.1998@free.fr>
References: <1463399550-4040-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5739B57E.6030209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/05/16 08:52, Yann E. MORIN wrote:

> With systemd, samba4 will need some special temporary files to be
> created on each boot, as explained in:
>      packaging/systemd/README
>
> Install the provided template file as configuration.
>
> However, this is not enough, as even the log directory is a tmpfs in
> the default Buildroot configuration, so we must also create the log
> directory on each boot. Hence we append this to the template installed
> above.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Regards.
