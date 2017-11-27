From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:31:45 +0100
Subject: [Buildroot] [PATCH 1/1] linphone: add libupnp dependency
In-Reply-To: <20171126212640.23519-1-fontaine.fabrice@gmail.com>
References: <20171126212640.23519-1-fontaine.fabrice@gmail.com>
Message-ID: <20171127093145.48bfa192@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Nov 2017 22:26:40 +0100, Fabrice Fontaine wrote:
> linphone is compatible with libupnp but not with libupnp18 so disable
> upnp if libupnp is not enabled
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/473c686f9bc5335d25b720cf1b0c45389138a7b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linphone/linphone.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Even though it fixes a build failure that happens only in next, I've
pushed this patch to the master branch, because we generally consider
adding such optional dependencies patches to be bug fixes.

So: applied to master with a reworked commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
