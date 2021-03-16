From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:23:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/siproxd: needs threads
In-Reply-To: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
References: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316212318.098e9ca9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Mar 2021 07:38:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> siproxd which has been added with commit
> 3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses pthread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/828448fff87772e1c34b3696284a44eb9fc692fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/siproxd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
