From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:46:13 +0200
Subject: [Buildroot] [PATCH 5/5] package/libungif: deprecate package
In-Reply-To: <1422300260-5361-5-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150404184613.448298e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 26 Jan 2015 20:24:20 +0100, Bernd Kuhls wrote:
> To be replaced with giflib.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libungif/Config.in |    2 ++
>  1 file changed, 2 insertions(+)

I cannot apply this patch: Kodi is still selecting libungif currently.

Can you resend an updated patch series that fixes Kodi before marking
libungif as deprecated ?

I'll mark this patch as Changes Requested in patchwork in the mean time.

Thanks,

Thomas

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
