From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 18:41:45 +0100
Subject: [Buildroot] [PATCH 1/5] liburcu: bump to version 0.8.0
In-Reply-To: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20131102184145.1846e69a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Wed, 30 Oct 2013 22:20:08 +0200, Olivier Schonken wrote:
> Also added a patch to keep liburcu from trying to build examples in doc directory,
> which breaks cross-compilation when enabled.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  .../liburcu/0001-Removed-Examples-from-doc.patch   | 22 ++++++++++++++++++++++
>  package/liburcu/liburcu.mk                         |  3 ++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 package/liburcu/0001-Removed-Examples-from-doc.patch

Can you instead integrate the upstream fix for the examples build
problem? See
http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=3343c545bbc5154d42dd37cd3ae869ef97555e00
for the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
