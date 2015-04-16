From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:13:49 +0200
Subject: [Buildroot] [PATCH] radvd: bump to version 2.11
In-Reply-To: <1429058276-15401-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429058276-15401-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150416081349.5fe1036e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 14 Apr 2015 21:37:56 -0300, Gustavo Zacarias wrote:
> No longer needs check (hence the patch) to build.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-check-requirement-we-don-t-do-unit-tests.patch | 29 ----------------------
>  package/radvd/radvd.hash                           |  4 +--
>  package/radvd/radvd.mk                             |  2 +-
>  3 files changed, 3 insertions(+), 32 deletions(-)
>  delete mode 100644 package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
