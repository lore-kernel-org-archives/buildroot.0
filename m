From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 22:01:45 +0100
Subject: [Buildroot] [PATCH v2] package/lua-curl: add variant definition
 of lcurl_url_t
In-Reply-To: <20190224195132.18844-1-francois.perrad@gadz.org>
References: <20190224195132.18844-1-francois.perrad@gadz.org>
Message-ID: <20190224220145.73529bb1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sun, 24 Feb 2019 20:51:32 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Fixes: http://autobuild.buildroot.org/results/8d76ad49837b368a7bba3c3dfd445a035471268a/
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...dd-variant-definition-of-lcurl_url_t.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch

Your commit messages are really too terse, they should contain more
details about the problem. I've extended the commit log and applied to
master.

Also, I noticed that packages built by the luarocks infrastructure have
code being built during the "installation to target" step, and nothing
built in the normal "build" step. Is this expected ? Can this be fixed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
