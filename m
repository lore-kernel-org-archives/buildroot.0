From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 23:01:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Add libsidplay2 as
 optional dependency
In-Reply-To: <1434658781-3455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434658781-3455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150628230103.035fd351@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 18 Jun 2015 22:19:41 +0200, Bernd Kuhls wrote:
> vlc has a sid plugin:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
>   output/target/usr/lib/vlc/plugins/demux/libsid_plugin.so |
>   grep NEEDED | grep sid
>  0x00000001 (NEEDED)     Shared library: [libsidplay2.so.1]
>  0x00000001 (NEEDED)     Shared library: [libresid-builder.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.mk |    7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
