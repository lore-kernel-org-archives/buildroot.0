From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 00:07:42 +0100
Subject: [Buildroot] [PATCH v4 2/5] package/hplip: Un-deprecate and bump
 version to 3.15.11
In-Reply-To: <1453328267-31962-3-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-3-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160122000742.2b7a9b82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Thu, 21 Jan 2016 00:17:44 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/hplip/0001-fix-make.patch | 40 +++++++++++++++++++--------------------
>  package/hplip/Config.in           |  2 --
>  package/hplip/hplip.hash          |  2 +-
>  package/hplip/hplip.mk            |  2 +-
>  4 files changed, 22 insertions(+), 24 deletions(-)

I've applied. However, I was horrified to discover the
0001-fix-make.patch (which already existed before this patch). Using
includedir this way is really wrong. So I fixed that up in a followup
commit:

  https://git.busybox.net/buildroot/commit/?id=ffca78cbcdab370a3916be51db3ca54ea03fba24

And also did another minor improvements:

  https://git.busybox.net/buildroot/commit/?id=3fc77e5f81906d774be2710b16166fca48fb3e05

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
