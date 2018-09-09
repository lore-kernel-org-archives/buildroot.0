From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:21:25 +0200
Subject: [Buildroot] [PATCH] circus: fix build with Python 3.7.0
In-Reply-To: <20180908203431.19594-1-thomas.petazzoni@bootlin.com>
References: <20180908203431.19594-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180909152125.533d8c7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 22:34:31 +0200, Thomas Petazzoni wrote:
> Python 3.7.0 makes 'async' a reserved keyword, but circus uses it as a
> method argument. This commit adds a patch to the circus package, which
> has been submitted upstream, to resolve this issue.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8122a00644810722b827cd5e0b90181996dc5657/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...s-rename-async-argument-of-_create_circus.patch | 97 ++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
