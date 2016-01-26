From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:21:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix musl build
In-Reply-To: <1453838206-10048-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453838206-10048-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126212109.3ad85f0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Tue, 26 Jan 2016 20:56:46 +0100, Bernd Kuhls wrote:
> Compile error occured using an allyesconfig, it seems it has not been
> caught by the autobuilders yet.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied your patch, thanks! However, could you try to use Git to
format the patches? It's a good practice, especially for Git hosted
projects.

Also, can you submit this patch to the upstream project ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
