From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:49:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] angularjs: new package.
In-Reply-To: <1437403844-19942-1-git-send-email-ignacy.gawedzki@green-communications.fr>
References: <1437403844-19942-1-git-send-email-ignacy.gawedzki@green-communications.fr>
Message-ID: <20150730234939.3976d6d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ignacy Gaw?dzki,

On Mon, 20 Jul 2015 16:50:44 +0200, Ignacy Gaw?dzki wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  package/Config.in                |  1 +
>  package/angularjs/Config.in      | 79 ++++++++++++++++++++++++++++++++++++++++
>  package/angularjs/angularjs.hash |  2 +
>  package/angularjs/angularjs.mk   | 38 +++++++++++++++++++
>  4 files changed, 120 insertions(+)
>  create mode 100644 package/angularjs/Config.in
>  create mode 100644 package/angularjs/angularjs.hash
>  create mode 100644 package/angularjs/angularjs.mk

Applied with some minor tweaks:

    [Thomas:
      - improve the <pkg>_EXTRACT_CMDS so that the source files really end
        up directly under $(@D) and not in a subdirectory of it. It makes
        the rest of the package simpler and more standard.
      - remove capital letters in the package name in Config.in, and do
        other minor tweaks in Config.in]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
