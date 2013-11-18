From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Nov 2013 12:06:35 +0100
Subject: [Buildroot] [PATCH] Apply upstream patch to set correct linkage
 on MIPS64
In-Reply-To: <1384772206-57234-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1384772206-57234-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131118120635.52bba816@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 18 Nov 2013 10:56:46 +0000, Vicente Olivert Riera wrote:
> Acked-by: Markos Chandras <markos.chandras@imgtec.com>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libtool/libtool-mips64-n64-linking.patch |   47 ++++++++++++++++++++++
>  1 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 package/libtool/libtool-mips64-n64-linking.patch

This looks good, but:

 * The title of your patch should start with "libtool: "

 * You want to name the patch file libtool-0001-<something>.patch, as
   per http://buildroot.org/downloads/manual/manual.html#patch-policy.

Also, I believe your commit log should mention more precisely which
problem it is fixing (I guess the most visible one is a build failure
of libiscsi on MIPS64 n32, I'm sure Markos remembers the details).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
