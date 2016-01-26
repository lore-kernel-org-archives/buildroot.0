From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:06:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: fix musl build
In-Reply-To: <1453642260-24302-3-git-send-email-bernd.kuhls@t-online.de>
References: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
 <1453642260-24302-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126220647.3067d8d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 14:31:00 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/78d/78daf927aa43591401a072230b582591add1204c/
> http://autobuild.buildroot.net/results/b7e/b7e42137e2a7379ea8acb76b2d4faece86ab488a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xl2tp/0002-musl.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/xl2tp/0002-musl.patch

I've applied, even if I'm not too happy with the patch since it's
probably not an upstream acceptable solution.

Could you submit the patch upstream (they have a github repo, so it's
easy), and see what they say ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
