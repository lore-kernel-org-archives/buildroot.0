From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 00:15:30 +0100
Subject: [Buildroot] [lua V3 7/8] ljlinenoise: new package
In-Reply-To: <1393694590-29945-8-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
 <1393694590-29945-8-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140302001530.25e0f51d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  1 Mar 2014 18:23:08 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                  |    1 +
>  package/ljlinenoise/Config.in      |   16 ++++++++++++++++
>  package/ljlinenoise/ljlinenoise.mk |   13 +++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/ljlinenoise/Config.in
>  create mode 100644 package/ljlinenoise/ljlinenoise.mk

Applied, after adjusting the Config.in file to indicate that ljsyscall
is a runtime dependency only.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
