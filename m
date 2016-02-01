From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 20:02:35 +0100
Subject: [Buildroot] [PATCH] package: aespipe: add host variant
In-Reply-To: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <20160201200235.6cba4eb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ariel D'Alessandro,

On Mon,  1 Feb 2016 12:37:27 -0300, Ariel D'Alessandro wrote:
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  package/Config.in.host         |  1 +
>  package/aespipe/Config.in.host | 10 ++++++++++
>  package/aespipe/aespipe.mk     |  1 +
>  3 files changed, 12 insertions(+)
>  create mode 100644 package/aespipe/Config.in.host

Can you give a justification as to why we would want to add aespipe as
a host package ? We generally try to limit the number of host packages
we add to package/Config.in.host, so it's good to include a
justification as to why it is a good idea to include aespipe as a
menuconfig-selectable host package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
