From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:28:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <20181023160931.16417-1-bernd.kuhls@t-online.de>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
Message-ID: <20181101222813.72c4126b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Oct 2018 18:09:31 +0200, Bernd Kuhls wrote:
> Upstream removed support for non-wchar toolchains:
> https://github.com/postgres/postgres/commit/85feb77aa09cda9ff3e12cf95c757c499dc25343
> 
> Propagate the new dependency to other packages.
> 
> Fixes
> http://autobuild.buildroot.net/results/b73/b73342a39167ed7f293224d4e3b23dde691b9abf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/bandwidthd/Config.in      | 5 +++--
>  package/collectd/Config.in        | 4 ++++
>  package/postgresql/Config.in      | 5 +++--
>  package/python-psycopg2/Config.in | 4 ++++
>  4 files changed, 14 insertions(+), 4 deletions(-)

I also propagated the dependency to php, qt and qt5base, and then
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
