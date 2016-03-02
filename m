From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 22:26:00 +0100
Subject: [Buildroot] [PATCH] lksctp-tools: new package
In-Reply-To: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160302222600.618f2a64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  2 Mar 2016 18:07:51 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                      |  1 +
>  package/lksctp-tools/Config.in         | 16 ++++++++++++++++
>  package/lksctp-tools/lksctp-tools.hash |  3 +++
>  package/lksctp-tools/lksctp-tools.mk   | 27 +++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 package/lksctp-tools/Config.in
>  create mode 100644 package/lksctp-tools/lksctp-tools.hash
>  create mode 100644 package/lksctp-tools/lksctp-tools.mk

We already  have a submission for the same package from Yegor
(initially submitted on Feb 26), which Arnout reviewed, and Yegor
posted a v2 on Feb 29.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
