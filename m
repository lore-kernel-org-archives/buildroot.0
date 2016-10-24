From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 17:45:39 +0200
Subject: [Buildroot] [PATCH 2/2] postgresql: enable ldap support for
 pg_service.conf
In-Reply-To: <1477318398-4734-2-git-send-email-cdf123@cdf123.net>
References: <1477318398-4734-1-git-send-email-cdf123@cdf123.net>
 <1477318398-4734-2-git-send-email-cdf123@cdf123.net>
Message-ID: <20161024174539.0a1ed028@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 09:13:18 -0500, Chris Frederick wrote:
> Just needed to add --with-ldap to POSTGRESQL_CONF_OPTS and add openldap
> to POSTGRESQL_DEPENDENCIES when BR2_PACKAGE_OPENLDAP is on
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>
> ---
>  package/postgresql/postgresql.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
