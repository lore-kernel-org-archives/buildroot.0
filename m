From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:12:25 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/php-xdebug: new package
In-Reply-To: <20191025182217.13682-2-nicolas.carrier@orolia.com>
References: <20191025182217.13682-1-nicolas.carrier@orolia.com>
 <20191025182217.13682-2-nicolas.carrier@orolia.com>
Message-ID: <20200903221225.4475a8ff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 18:22:49 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Extension for PHP to assist with debugging and development.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---

Thanks, I've finally applied! I updated to a newer version of
php-xdebug to make it compatible with the newer version of PHP we have,
and fixed a small issue caused by other changes in the autoconf
variables in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
