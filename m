From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:31:26 +0100
Subject: [Buildroot] [PATCH 2/9] debianutils: new package
In-Reply-To: <1416330117-4458-3-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141118233126.66398953@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 14:01:50 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                    |  1 +
>  package/debianutils/Config.in        |  7 +++++++
>  package/debianutils/debianutils.hash |  2 ++
>  package/debianutils/debianutils.mk   | 14 ++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/debianutils/Config.in
>  create mode 100644 package/debianutils/debianutils.hash
>  create mode 100644 package/debianutils/debianutils.mk

Thanks, patch applied to next. However, I've added an optional
dependency on Busybox, since debianutils installs 'which', which is
also installed by Busybox.

Thanks to Arnout for the review and testing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
