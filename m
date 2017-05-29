From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:53:58 +0200
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.169
In-Reply-To: <b55c4c39417ad139014c611fc3a24ecf312d68db.1496091203.git.baruch@tkos.co.il>
References: <b55c4c39417ad139014c611fc3a24ecf312d68db.1496091203.git.baruch@tkos.co.il>
Message-ID: <20170529235358.683ea67e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 23:53:23 +0300, Baruch Siach wrote:
> Fixes a number of security issues: CVE-2017-7607, CVE-2017-7608,
> CVE-2017-7609, CVE-2017-7610, CVE-2017-7611, CVE-2017-7612, CVE-2017-7613.
> 
> Rebase patches, and convert to git format.
> 
> Remove --disable-werror; unrecognized configure option.
> 
> Use upstream provided hash.
> 
> Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/elfutils/0002-disable-progs.patch          | 52 ++++++++-----
>  package/elfutils/0003-fts.patch                    | 91 ++++++++++++++--------
>  ...y-make-werror-conditional-to-build-werror.patch | 22 ++++--
>  package/elfutils/elfutils.hash                     |  4 +-
>  package/elfutils/elfutils.mk                       |  4 +-
>  5 files changed, 109 insertions(+), 64 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
