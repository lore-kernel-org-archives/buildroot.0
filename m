From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:44:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: needs PCRE with UTF
 support
In-Reply-To: <20190423170526.26577-1-fontaine.fabrice@gmail.com>
References: <20190423170526.26577-1-fontaine.fabrice@gmail.com>
Message-ID: <20190424224456.6f1047f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Apr 2019 19:05:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mongodb needs PCRE with UTF-8 support, see:
> https://docs.mongodb.com/manual/reference/operator/query/regex/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongodb/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
