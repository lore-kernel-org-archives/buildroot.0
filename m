From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 13:55:47 +0100
Subject: [Buildroot] [PATCH v1] collectd: add configure hint for
 pg_config
In-Reply-To: <1426025287-5166-1-git-send-email-ps.report@gmx.net>
References: <1426025287-5166-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150317135547.09311e5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 10 Mar 2015 23:08:07 +0100, Peter Seiderer wrote:
> Fixes [1] in case postgresql-devel package is installed on the host:
> 
>     libpq . . . . . . . . no (libpq-fe.h not found)
>     postgresql  . . . . . no (dependency error)
>     configure: error: "Some plugins are missing dependencies - see the summary above for details"
> 
> Otherwise fixes the following configure warning:
> 
> 	configure: WARNING: pg_config returned with status 127
> 
> [1] http://autobuild.buildroot.net/results/336/336b3e932be245faa04969af960702af672916dc
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Seems like it doesn't work:
http://autobuild.buildroot.org/results/926/926a43b8f635790d7e9abdc977ea803ddaf8a523/build-end.log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
