From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 18 Apr 2014 10:39:08 +0300
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417213939.35afc5ff@skate>
References: <20140417063009.B2279100D24@stock.ovh.net>
 <20140417213939.35afc5ff@skate>
Message-ID: <201404181039.08079.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 April 2014 22:39:39 Thomas Petazzoni wrote:
> >     x86_64 |                  qt5base-5.2.1 | NOK |
> >http://autobuild.buildroot.net/results/e3b26ee314880fdb50bb774a0539bfba04
> >d9fbcf/
> 
> posix_fallocate() problem:
> 
> ../../../3rdparty/sqlite/sqlite3.c:23535:42: error: 'posix_fallocate'
> undeclared here (not in a function)
> ../../../3rdparty/sqlite/sqlite3.c:93246:1: warning: missing initializer
> [-Wmissing-field-initializers] ../../../3rdparty/sqlite/sqlite3.c:93246:1:
> warning: (near initialization for 'sqlite3Apis.aggregate_count')
> [-Wmissing-field-initializers]

It seems one of the hunks in out posix_fallocate() patch is not upstreamed. 
Preparing a patch.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140418/73e2f145/attachment.html>
