From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:19:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: needs gcc >= 4.9
In-Reply-To: <20191015193901.29050-1-fontaine.fabrice@gmail.com>
References: <20191015193901.29050-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016221945.3eba37ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 21:39:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libpqxx uses brace-initialisation since version 6.3.0 and
> https://github.com/jtv/libpqxx/commit/c93a4626f4d1311a9566f5d8d69052acf2082df9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3416a2eaa6b69014f733d38a17c161b024301534
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpqxx/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
