From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 16:52:21 +0100
Subject: [Buildroot] [PATCH v3 1/2] Revert "package/initscripts:
 S40network: wait for network interfaces to appear"
In-Reply-To: <1446109218-11057-2-git-send-email-jezz@sysmic.org>
References: <1446109218-11057-1-git-send-email-jezz@sysmic.org>
 <1446109218-11057-2-git-send-email-jezz@sysmic.org>
Message-ID: <20151102165221.658e28de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 29 Oct 2015 10:00:17 +0100, J?r?me Pouiller wrote:
> This reverts commit 49964858f45d2243c513e6d362e992ad89ec7a45. It is
> going to be replaced with an ifup hook in next patch.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/initscripts/init.d/S40network | 29 -----------------------------
>  1 file changed, 29 deletions(-)

Both patches applied, thanks a lot!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
