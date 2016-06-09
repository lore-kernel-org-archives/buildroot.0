From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 16:34:12 +0200
Subject: [Buildroot] [PATCH 1/2] python-dataproperty: new package
In-Reply-To: <1465457873-15204-1-git-send-email-yegorslists@googlemail.com>
References: <1465457873-15204-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160609163412.5c3d7257@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 09:37:52 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                    |  1 +
>  package/python-dataproperty/Config.in                |  9 +++++++++
>  package/python-dataproperty/python-dataproperty.hash |  4 ++++
>  package/python-dataproperty/python-dataproperty.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-dataproperty/Config.in
>  create mode 100644 package/python-dataproperty/python-dataproperty.hash
>  create mode 100644 package/python-dataproperty/python-dataproperty.mk

Causes a new build failure:

   http://autobuild.buildroot.net/results/85e/85e5086401a314a2d3d24efa887ac0188add85fc/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
