From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:35:22 +0100
Subject: [Buildroot] [PATCH] libgtk2: point to the proper cups-config
In-Reply-To: <1459019854-13008-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459019854-13008-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160326213522.4705ee0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Mar 2016 16:17:34 -0300, Gustavo Zacarias wrote:
> Otherwise it can pick up the distro cups-config if it's present, leading
> to improper library usage/linkage. Fixes:
> http://autobuild.buildroot.net/results/bf4/bf493977817a750427aae82e71a5257187bd7344/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgtk2/libgtk2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
