From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 13:17:48 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: linux-pam is needed for su
In-Reply-To: <20170903074829.3782-1-bernd.kuhls@t-online.de>
References: <20170903074829.3782-1-bernd.kuhls@t-online.de>
Message-ID: <20170903131748.0d128700@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 09:48:29 +0200, Bernd Kuhls wrote:
> With linux-pam, the configure script bails out with:
> 
> configure: error: su selected, but required PAM header file not available
> 
> Fixes:
> http://autobuild.buildroot.net/results/338/3381a49d17aa0d4b9711cbb36a5d7b563a8ae08f/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/util-linux/Config.in | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
