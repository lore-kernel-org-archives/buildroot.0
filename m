From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:38:41 +0200
Subject: [Buildroot] [PATCH] libgtk3: wayland backend requires headers
 >= 3.17
In-Reply-To: <1459257166-21672-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459257166-21672-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329163841.62972d62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 10:12:46 -0300, Gustavo Zacarias wrote:
> As pointed by Thomas, fixes:
> http://autobuild.buildroot.org/results/473/473fb2f416311ee8a8a8719e3fb3689d9226f451/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgtk3/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
