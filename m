From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 17:55:32 +0100
Subject: [Buildroot] [PATCH 04/19] python-click: new package
In-Reply-To: <1454373899-22481-5-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-5-git-send-email-mc5686@mclink.it>
Message-ID: <20160202175532.47ad9ec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Tue,  2 Feb 2016 01:44:44 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                      |  1 +
>  package/python-click/Config.in         |  7 +++++++
>  package/python-click/python-click.hash |  3 +++
>  package/python-click/python-click.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-click/Config.in
>  create mode 100644 package/python-click/python-click.hash
>  create mode 100644 package/python-click/python-click.mk

I've applied, after fixing a few things:

    [Thomas:
     - rewrap Config.in help text, lines were slightly too long
     - remove excessive empty line at end of Config.in
     - specify BSD-3c as the license, since BSD is not specific enough.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
