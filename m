From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:29:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/xmlstarlet: Fix static build
In-Reply-To: <1450000426-2564-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450000426-2564-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213142903.74df7554@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 10:53:46 +0100, Bernd Kuhls wrote:
> If libxml2 depends on xz (liblzma) static linking is broken.
> 
> Fixes
> http://autobuild.buildroot.net/results/df3/df3f5fa770833c8c4344ee0bc67f45aa578ce542/
> http://autobuild.buildroot.net/results/070/07021c8bd6e2031c2717fc58e2d3ff30c412fa90/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xmlstarlet/xmlstarlet.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
