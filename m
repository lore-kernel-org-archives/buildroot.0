From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 10 Feb 2020 19:32:13 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
In-Reply-To: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
References: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200210183213.GA22114@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

> Bump to version 2.4.3 of nfs-utils. All patches have been upstreamed, so
> drop them all. It must be used rpcgen build by host-nfs-utils, to do
> this let's pass its path to --with-rpcgen= instead of 'internal'.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for updating it.
I've tested it some time ago, but there are a few more upstream changes so going
to test it again.

Kind regards,
Petr
