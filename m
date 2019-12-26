From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 13:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: propagate boost-thread
 dependency on a toolchain without bug 64735
In-Reply-To: <20191226110404.2623366-1-fontaine.fabrice@gmail.com>
References: <20191226110404.2623366-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226134504.1b63bc21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 12:04:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit d7e49f5f42881f8781e7a8add6e0114af0bd9511 does not fully propagate
> the dependency on a toolchain without bug 64735 to reverse dependencies
> of boost-thread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2b0ca8ce4df7496dcc7d078fae2114d75bd0a455
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
