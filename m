From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:06:13 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/avahi: configure option
 pygtk was renamed to pygobject
In-Reply-To: <20171127202700.28697-1-bernd.kuhls@t-online.de>
References: <20171127202700.28697-1-bernd.kuhls@t-online.de>
Message-ID: <20171203230613.71608b7c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 21:27:00 +0100, Bernd Kuhls wrote:
> See corresponding commit:
> https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65
> 
> Fixes
> http://autobuild.buildroot.net/results/1e9/1e974c814ae4236077a869339be1143a9af7e5cd/
> http://autobuild.buildroot.net/results/010/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca/
> http://autobuild.buildroot.net/results/572/5721634ffa2a4544a82dda08c1fcea331ecdadaf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/avahi/avahi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
