From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 16:40:57 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <CAGYS=dGjxAW+tP+MOp2yy_Ld0AnCM=XM9cSod3E0CnBtm31Q9g@mail.gmail.com>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <CAGYS=dGjxAW+tP+MOp2yy_Ld0AnCM=XM9cSod3E0CnBtm31Q9g@mail.gmail.com>
Message-ID: <20180226164057.638709b3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 15:30:42 +0000, Mahyar Koshkouei wrote:

> With regards to the mpv issue, the compile error occurs because the
> "odroid-mali" package sets the cflags "-DMESA_EGL_NO_X11_HEADERS"
> which mpv seems to ignore. A linking error then occurs in mpv when
> forcing the cflag.
> 
> Therefore I propose to disable mali support in mpv using
> "--disable-mali-fbdev" until someone who has interest in mpv support
> on the odroid comes and fixes this.

That's fine with me.

> Additionally, I have updated mpv to the latest minor release 0.27.2 to
> fix CVE-2018-6360 security issue.

OK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
