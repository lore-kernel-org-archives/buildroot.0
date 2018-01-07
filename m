From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:35:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/pound: Fix build with openssl
 1.0.2
In-Reply-To: <20180107160952.25244-1-bernd.kuhls@t-online.de>
References: <20180107160952.25244-1-bernd.kuhls@t-online.de>
Message-ID: <20180107213523.509a8f07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 17:09:52 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/5be/5be1082dee8387b1140d802ac3c788896a4bf980/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pound/0001-fix-openssl-1.0.2.patch | 127 +++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 package/pound/0001-fix-openssl-1.0.2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
