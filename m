From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 17:12:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ruby: enable openssl for
 host-ruby
In-Reply-To: <20191025133705.32021-1-nicolas.carrier@orolia.com>
References: <20191025133705.32021-1-nicolas.carrier@orolia.com>
Message-ID: <20191025171206.41a0b340@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 13:37:20 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Openssl is required so that Gem can install ruby gems from secure websites.
> 
> ERROR:  While executing gem ... (Gem::Exception)
>     Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
> use non-HTTPS sources
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---
> Changes v1 -> v2:
>   - remove original committer, since he has left the company
>   - added dependency on host-openssl
> ---
>  package/ruby/ruby.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
