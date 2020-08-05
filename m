From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 14:16:05 +0200
Subject: [Buildroot] [PATCH] package/ruby: security bump to version
 2.4.10
In-Reply-To: <20200804100833.13787-1-peter@korsgaard.com>
References: <20200804100833.13787-1-peter@korsgaard.com>
Message-ID: <20200805141605.5fd812e8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Aug 2020 12:08:33 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2020-10663: Unsafe Object Creation Vulnerability in JSON (Additional
>   fix)
>   https://www.ruby-lang.org/en/news/2020/03/19/json-dos-cve-2020-10663/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
