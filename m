From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 21:46:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build issues
 under musl
In-Reply-To: <1438271680-3692-1-git-send-email-brendanheading@gmail.com>
References: <1438271680-3692-1-git-send-email-brendanheading@gmail.com>
Message-ID: <1438285601.21638.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2015-07-30 at 16:54 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/b97/b97f1e9cd459da96e3e1
> 680bb7c43d8103ab12c2/build-end.log
> 
> Patches by Thomas to refactor detection of __always_inline and 
> backtrace
> detection. Also added #include <limits.h> for PATH_MAX.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

btrfs-progs successfully builds with musl after applying this patch.

Tested-by: J?rg Krause <joerg.krause@embedded.rocks>
