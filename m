From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 22:31:37 +0100
Subject: [Buildroot] [PATCH 2/2]
 package/x11r7/xdriver_xf86-video-nouveau: Fix DRI dependency
In-Reply-To: <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
References: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
 <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160322223137.18eaf2bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Dec 2015 17:53:35 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-nouveau/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

I've just sent a series at
http://lists.busybox.net/pipermail/buildroot/2016-March/156858.html,
which I believe is a better fix for this problem. More details are
available in the cover letter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
