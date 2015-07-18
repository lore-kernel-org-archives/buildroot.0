From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 22:11:49 +0200
Subject: [Buildroot] [PATCH] package: add shadow 4.2.1
In-Reply-To: <1426736888-29437-3-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-3-git-send-email-steven@uplinklabs.net>
Message-ID: <20150718221149.7d6a85bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Steven,

On Wed, 18 Mar 2015 20:48:05 -0700, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/Config.in                                 |   1 +
>  package/shadow/Config.in                          |  10 +
>  package/shadow/chgpasswd.pam                      |   4 +
>  package/shadow/chpasswd.pam                       |   6 +
>  package/shadow/newusers.pam                       |   6 +
>  package/shadow/passwd.pam                         |   4 +
>  package/shadow/remove-util-linux-conflicts.patch  | 642 ++++++++++++++++++++++
>  package/shadow/shadow-4.2.1-subordinate-ids.patch |  34 ++
>  package/shadow/shadow-strncpy-usage.patch         |  25 +
>  package/shadow/shadow.hash                        |   1 +
>  package/shadow/shadow.mk                          |  43 ++
>  package/shadow/xstrdup.patch                      |   9 +
>  12 files changed, 785 insertions(+)
>  create mode 100644 package/shadow/Config.in
>  create mode 100644 package/shadow/chgpasswd.pam
>  create mode 100644 package/shadow/chpasswd.pam
>  create mode 100644 package/shadow/newusers.pam
>  create mode 100644 package/shadow/passwd.pam
>  create mode 100644 package/shadow/remove-util-linux-conflicts.patch
>  create mode 100644 package/shadow/shadow-4.2.1-subordinate-ids.patch
>  create mode 100644 package/shadow/shadow-strncpy-usage.patch
>  create mode 100644 package/shadow/shadow.hash
>  create mode 100644 package/shadow/shadow.mk
>  create mode 100644 package/shadow/xstrdup.patch

Shortly after you submitted this patch, Ryan Barnett (in Cc) made a
number of comments / asked some questions, but you never answered or
posted a new version.

Ryan also mentioned that another proposal had been made for the shadow
package, as part of the SELinux support. While the SELinux series is
still on-going (some of it has been merged, some remains to be merged),
the shadow package is no longer part of it.

Therefore, Steven and Ryan, if you still care about shadow, please
resubmit a new version that addresses the different problems/questions.

In the mean time, I'll mark the patch as Changes Requested in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
