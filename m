From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:55:52 +0200
Subject: [Buildroot] [PATCH v2 1/3] gdb: get rid of host-texinfo
 dependency
In-Reply-To: <1475953413-1950-1-git-send-email-patrickdepinguin@gmail.com>
References: <1475953413-1950-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20161009135552.5dd553fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Oct 2016 21:03:31 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The host-texinfo dependency in gdb/host-gdb was added because gdb insisted
> in building info documentation in recent versions, and we want to avoid
> 'makeinfo' to be present on the build system.
> 
> However, there is another solution that does not require actually building
> host-texinfo: instruct the makefiles to use a dummy makeinfo command
> ('true').
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/gdb/gdb.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

All three patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
