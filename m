From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:26:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/proftpd: add mod_{sql,
 quotatab} support
In-Reply-To: <1538157459-10690-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1538157459-10690-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <20181011172657.3d46b5d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Sep 2018 12:57:38 -0500, Jared Bents wrote:
>  - Enables mod_sql which is required for quotatab_sql
>  - Adds options for enabling mod_quotatab and the sub-component
>    file/LDAP/RADIUS/SQL modules
>  - Copies over ftpquota script if perl and mod_quotatab are
>    enabled (This script isn't required but is an additional tool
>    for mod_quotatab)
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
>  - Select BR2_PACKAGE_PROFTPD_MOD_SQL instead of Depend
>  - Removed install hook and adjusted ftpquota install logic
>  - Moved ftpasswd to separate patch
> ---
>  package/proftpd/Config.in  | 39 +++++++++++++++++++++++++++++++++++++++
>  package/proftpd/proftpd.mk | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
