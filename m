From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:52:08 +0100
Subject: [Buildroot] [PATCH] grep: bump to version 2.22
In-Reply-To: <1446547923-23592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446547923-23592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151103155208.7c83f261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Nov 2015 07:52:03 -0300, Gustavo Zacarias wrote:
> Drop security patch since it's upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/grep/0001-fix-CVE-2015-1345.patch | 20 --------------------
>  package/grep/grep.hash                    |  2 +-
>  package/grep/grep.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 package/grep/0001-fix-CVE-2015-1345.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
