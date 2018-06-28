From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Fri, 29 Jun 2018 00:45:56 +0200
Subject: [Buildroot] [PATCH 1/1] nginx: Bump to version 1.15.0
In-Reply-To: <20180628211330.66c97ec8@windsurf>
References: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
 <20180628211330.66c97ec8@windsurf>
Message-ID: <20180628224556.537guyhu7xwdkmrc@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2018 at 09:13:30PM +0200, thus spake Thomas Petazzoni:
> Hello,

Hi,

> On Wed, 27 Jun 2018 15:51:46 +0200, Ignacy Gaw?dzki wrote:
> > Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > ---
> >  ...-rework-autotest-to-be-cross-compila.patch |   6 +-
> >  ...-mechanism-allowing-to-force-feature.patch |   8 +-
> >  ...ture_run_force_result-for-each-featu.patch |  56 ++--
> >  ...auto-lib-libxslt-conf-use-pkg-config.patch |  10 +-
> >  ...ake-sys_nerr-guessing-cross-friendly.patch |  16 +-
> >  ...auto-lib-openssl-conf-use-pkg-config.patch | 249 ++++++++++++++++--
> >  ...7-auto-lib-libgd-conf-use-pkg-config.patch |   6 +-
> >  ...linux_config.h-only-include-dlfcn.h-.patch |   6 +-
> 
> What happened to those patches ? Just refreshed ?

Yes, refreshed, so that they apply properly.

> >  ...x-PCRE-condition-WRT-the-http-and-ht.patch |  33 ---
> 
> Why is this patch removed ?

It has been applied upstream.

Cheers,

Ignacy

-- 
Ignacy Gaw?dzki
R&D Engineer
Green Communications
