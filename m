From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:58:56 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/radvd: fix build without
 stack-protector
In-Reply-To: <20201119120347.1871672-1-fontaine.fabrice@gmail.com>
References: <20201119120347.1871672-1-fontaine.fabrice@gmail.com>
Message-ID: <20201119225856.491e9c01@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 13:03:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 6e85ab44493624748398ffb2c6bf4bda409f2de7 forgot to manage the new
> --{with,without}-stack-protector option which has been added with
> https://github.com/reubenhwk/radvd/commit/f2cb35449f35b5815f3804161c968fde5ef2982b
> and is enabled by default
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e778df96f0a382a5b119724ee69f956ad455c452
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/radvd/radvd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
