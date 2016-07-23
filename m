From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 17:03:17 +0200
Subject: [Buildroot] [PATCH] lighttpd: webdav locks require libuuid
In-Reply-To: <1469285804-3153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469285804-3153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723170317.5f968a5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 11:56:44 -0300, Gustavo Zacarias wrote:
> Since 1.4.40 webdav locks require libuuid from util-linux, so make it an
> automatic dependency. Fixes:
> http://autobuild.buildroot.net/results/b14/b14484300b4acfcaa18593b097167cef14330898/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/lighttpd/lighttpd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
