From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 19:18:02 +0100
Subject: [Buildroot] [PATCH 2/2] package/numactl: fix musl build
In-Reply-To: <1454145490-11822-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454145490-11822-1-git-send-email-bernd.kuhls@t-online.de>
 <1454145490-11822-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207191802.4ad6514f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 10:18:10 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/355/3555cd0abe68b6f0e2b2089af5ce26dbc4c73df6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/numactl/0001-musl.patch | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/numactl/0001-musl.patch

I've applied after renaming the patch, and improving its description.

See:

  https://git.busybox.net/buildroot/commit/?id=21ed7a92fe5a771911ef06f97522e504d0eebbc2

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
