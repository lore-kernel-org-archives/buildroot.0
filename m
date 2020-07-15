From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:27:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: security bump to
 version 4.2.8
In-Reply-To: <20200715063301.2469961-1-fontaine.fabrice@gmail.com>
References: <20200715063301.2469961-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715172737.36c8d613@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 08:33:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following security issues:
> - SERVER-45514 [FLE] Reject document validators with encryption-related
>   keywords if the validationAction is ?warn?
> - SERVER-48039 Unrecognized option: net.ssl.clusterCertificateSelector
>   in MongoDB v4.2
> - SERVER-45803 mongodecrypt needs a ServiceContext
> - SERVER-46834 Use monotonic time in UserCacheInvalidator
> - SERVER-47113 LDAP connection pool acquisition state should own host
>   list
> 
> https://docs.mongodb.com/manual/release-notes/4.2
> 
> Also:
> - Update indentation in hash file (two spaces)
> - Tweak version to be "compliant" with https://release-monitoring.org
> - Use official tarball
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongodb/mongodb.hash | 6 +++---
>  package/mongodb/mongodb.mk   | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
