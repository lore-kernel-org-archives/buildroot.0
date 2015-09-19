From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:17:19 +0200
Subject: [Buildroot] [PATCH v2] check: new package
In-Reply-To: <1442666511-17751-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1442666511-17751-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150919151719.7b00e8ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Sat, 19 Sep 2015 09:41:51 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/Config.in        |  1 +
>  package/check/Config.in  |  6 ++++++
>  package/check/check.hash |  3 +++
>  package/check/check.mk   | 20 ++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/check/Config.in
>  create mode 100644 package/check/check.hash
>  create mode 100644 package/check/check.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
