From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:35:25 +0100
Subject: [Buildroot] [PATCH 1/3] hostapd: fix static linking
In-Reply-To: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140304193525.78539daf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  4 Mar 2014 10:35:11 -0300, Gustavo Zacarias wrote:
> A rebase of Samuel Martin's http://patchwork.ozlabs.org/patch/312320/
> hostapd doesn't use pkg-config and upstream likely wouldn't take a patch
> to do so (hostapd/wpa_supplicant are used in android builds, and it
> doesn't use any auto* stuff either) so pass it in LIBS since we
> always build openssl with libz support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/hostapd/hostapd.mk | 1 +
>  1 file changed, 1 insertion(+)

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
