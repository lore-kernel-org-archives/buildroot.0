From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 16:06:53 +0200
Subject: [Buildroot] [PATCH 3/3] package/tvheadend: reduce target binary
 size by using pngquant
In-Reply-To: <20170408151804.11102-3-bernd.kuhls@t-online.de>
References: <20170408151804.11102-1-bernd.kuhls@t-online.de>
 <20170408151804.11102-3-bernd.kuhls@t-online.de>
Message-ID: <20170409160653.3b0ee4ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 17:18:04 +0200, Bernd Kuhls wrote:
> Support was added by this commit:
> https://github.com/tvheadend/tvheadend/commit/8bf3932539ceadb3bfc1c9453f11175f15aefad2
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
