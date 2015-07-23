From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 09:00:26 +0200
Subject: [Buildroot] [PATCH v3 1/1] mosh: new package
In-Reply-To: <1437633426-23375-1-git-send-email-christian@paral.in>
References: <1437633426-23375-1-git-send-email-christian@paral.in>
Message-ID: <20150723090026.05c94844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Wed, 22 Jul 2015 23:37:06 -0700, Christian Stewart wrote:
> Adding mosh, the mobile shell.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                                  |  1 +
>  package/mosh/0001-use-version-from-buildroot.patch | 23 ++++++++++++++++++++++
>  package/mosh/Config.in                             | 22 +++++++++++++++++++++
>  package/mosh/mosh.hash                             |  1 +
>  package/mosh/mosh.mk                               | 17 ++++++++++++++++
>  5 files changed, 64 insertions(+)
>  create mode 100644 package/mosh/0001-use-version-from-buildroot.patch
>  create mode 100644 package/mosh/Config.in
>  create mode 100644 package/mosh/mosh.hash
>  create mode 100644 package/mosh/mosh.mk

We had an earlier submission of the mosh package, at
http://patchwork.ozlabs.org/patch/451726/. Can you compare it to yours
and see if some improvements in your new proposal could be made based
on this older patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
