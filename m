From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:56:00 +0100
Subject: [Buildroot] [PATCHv3] python-paho-mqtt: add new package
In-Reply-To: <1451463207-2630-1-git-send-email-zinosat@tiscali.it>
References: <1451463207-2630-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20151230155600.3352bbba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Wed, 30 Dec 2015 09:13:27 +0100, Davide Viti wrote:
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor didn't give you his Reviewed-by. It is not because someone
commented on your patch that this person is giving you his formal
Reviewed-by.

See
http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L539
for the meaning of Reviewed-by.

And specifically, if someone has made comments, it indicates that your
patch wasn't fully correct, and therefore this person is *not* giving
you his Reviewed-by.

> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> 
> v1 -> v2:
>  - Provide official md5 (suggested by Yegor Yefremov)
>  - Reword package description (suggested by Thomas Petazzoni)
>  - Use "distutils" setup type (suggested by Yegor Yefremov)
>  - Add "depends on BR2_PACKAGE_PYTHON" in Config.in
>  - Test with Python3 (suggested by Yegor Yefremov)
> 
> v2 -> v3:
>  - Remove dependency on BR2_PACKAGE_PYTHON since the package builds
>    fine against Python 3 (suggested by Yegor Yefremov)

Such changelog is very good, but should be place below the "---" sign...

> 
> ---

here.

If you don't do this, when I apply the patch, the changelog is kept in
the commit log, which we don't want.

I've fixed those two minor issues, and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
