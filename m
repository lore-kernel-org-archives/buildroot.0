From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 20:38:27 +0100
Subject: [Buildroot] [PATCH 07/19] python-netaddr: new package
In-Reply-To: <1454373899-22481-8-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-8-git-send-email-mc5686@mclink.it>
Message-ID: <20160202203827.1be6f539@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Tue,  2 Feb 2016 01:44:47 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                          |  1 +
>  package/python-netaddr/Config.in           |  7 +++++++
>  package/python-netaddr/python-netaddr.hash |  3 +++
>  package/python-netaddr/python-netaddr.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-netaddr/Config.in
>  create mode 100644 package/python-netaddr/python-netaddr.hash
>  create mode 100644 package/python-netaddr/python-netaddr.mk

Applied after doing some changes:

    [Thomas:
      - remove excessive empty new line at the end of Config.in
      - specify BSD-3c as the license, since it's the variant being
    used, and it's more specific than just BSD.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
