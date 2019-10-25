From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 15:07:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/ruby: enable openssl for
 host-ruby
In-Reply-To: <20191025124156.16411-1-nicolas.carrier@orolia.com>
References: <20191025124156.16411-1-nicolas.carrier@orolia.com>
Message-ID: <20191025150732.392dabba@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Fri, 25 Oct 2019 12:42:12 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> From: Andrew Viteri <andrew.viteri@orolia.com>
> 
> Openssl is required so that Gem can install ruby gems from secure websites.
> 
> ERROR:  While executing gem ... (Gem::Exception)
>     Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
> use non-HTTPS sources
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

But then, host-openssl should be added in HOST_RUBY_DEPENDENCIES, no ?

Also, since the patch was authored by Andrew, we need to have his
Signed-off-by first, followed by your Signed-off-by, as the person
conveying the patch from Andrew to us.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
