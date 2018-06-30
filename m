From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:23:14 +0200
Subject: [Buildroot] [PATCH 1/1] replace invocation of tempfile w/
 mktemp in try-run
In-Reply-To: <20180629214012.26644-1-joseph.kogut@gmail.com>
References: <20180629214012.26644-1-joseph.kogut@gmail.com>
Message-ID: <20180630182314.3741a2df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 14:40:12 -0700, Joseph Kogut wrote:
> mktemp is included in GNU Coreutils, and its usage is preferred over
> tempfile.
> 
> http://lists.gnu.org/archive/html/bug-coreutils/2007-10/msg00134.html
> 
> Additionally, some distributions no longer package tempfile, and
> this patch fixes try-run in that case.
> 
> Fixes:
> http://autobuild.buildroot.net/results/db5/db50f4415d18441f94b641ef6dc5a3672678b8b9/
> http://autobuild.buildroot.net/results/76d/76d73f767d3aab3c97d61188f5666899d72ed82d/
> http://autobuild.buildroot.net/results/6aa/6aa9031962603354086b49bc49add92fde496ec2/
> http://autobuild.buildroot.net/results/33d/33d22f4d96fb439be8551355290896ef6d3649df/
> http://autobuild.buildroot.net/results/eee/eeec2ed80e147c172ec2d50958b12cfa38b2cc8d/
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an edited/improved commit title and log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
