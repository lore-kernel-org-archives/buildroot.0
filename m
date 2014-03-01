From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 21:02:38 +0100
Subject: [Buildroot] [PATCHv2] lzip: new package
In-Reply-To: <1393700655-14223-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393700655-14223-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301210238.30d7cb49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  1 Mar 2014 16:04:15 -0300, Gustavo Zacarias wrote:
> The host variant is in preparation for possibly some gnu packages
> shipping tar.lz versions only.
> At least ed 1.10 did it (still needed to add extraction support for it).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in      |  1 +
>  package/lzip/Config.in | 15 +++++++++++++++
>  package/lzip/lzip.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 package/lzip/Config.in
>  create mode 100644 package/lzip/lzip.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
