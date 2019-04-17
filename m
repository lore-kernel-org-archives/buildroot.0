From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:42:42 +0200
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 2.4.6
In-Reply-To: <20190416213340.14880-1-peter@korsgaard.com>
References: <20190416213340.14880-1-peter@korsgaard.com>
Message-ID: <20190417084242.2debcd43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 23:33:40 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2019-8320: Delete directory using symlink when decompressing tar
> - CVE-2019-8321: Escape sequence injection vulnerability in verbose
> - CVE-2019-8322: Escape sequence injection vulnerability in gem owner
> - CVE-2019-8323: Escape sequence injection vulnerability in API response handling
> - CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
> - CVE-2019-8325: Escape sequence injection vulnerability in errors
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
