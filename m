From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 5 Mar 2020 05:44:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200228173052.5128-1-petr.vorel@gmail.com>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
Message-ID: <20200305044423.GA2842685@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

sorry, previous reply was for the second patch.

> Is this for master or next ? Are you talking about gcc 10 for the host
> or gcc 10 for the target ?
I experienced this just when for native build on other distro (this patch was
needed for openSUSE), send with a hope it's useful. But feel free to drop it,
libtirpc is releasing often, now it's libtirpc-1-2-6-rc2. As nobody complains
about it, it can wait till the package release.

Kind regards,
Petr
