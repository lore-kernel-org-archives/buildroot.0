From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/zip: add host-zip
In-Reply-To: <1454692180-6467-1-git-send-email-martin@barkynet.com>
References: <1454692180-6467-1-git-send-email-martin@barkynet.com>
Message-ID: <20160220142450.53035e3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Fri,  5 Feb 2016 17:09:40 +0000, Martin Bark wrote:
> Make the host variant of zip available.  This can be useful in
> post-{build,image} scripts.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/Config.in.host     |  1 +
>  package/zip/Config.in.host | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 package/zip/Config.in.host

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
