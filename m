From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:33:13 +0200
Subject: [Buildroot] [PATCH 05/10] linux-pam: add support for SELinux
In-Reply-To: <1378429464-12546-6-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-6-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908183313.11837602@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:19 -0500, Ryan Barnett wrote:
> Added patches to fix issues with linux-pam's audit support and to
> correctly install pam_sepermit.
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  ...t_log_acct_message_return_value_check_fix.patch |   16 ++++++++++++++++
>  ...inux-pam-sepermit-install-path-correction.patch |   11 +++++++++++

Same comment about patches: add a description + Signed-off-by, see
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

What about the upstream status of those patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
