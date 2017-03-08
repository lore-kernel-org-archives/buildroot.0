From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 21:11:24 +0100
Subject: [Buildroot] [PATCH 1/1] lighttpd: source default file from
 startup script
In-Reply-To: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
References: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
Message-ID: <20170308211124.50d94081@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Mar 2017 10:21:14 -0500, Philipp Skadorov wrote:
> lighttpd server runs cgi application that has no way to get environment
> variables that are set up for it.
> 
> S50lighttpd is changed to source /etc/default/lighttpd file where these
> environment variables can be set up.
> 
> Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>

There is a mismatch between the commit log (which only talks about
sourcing a default file) and the actual commit which not only sources a
default file, but also refactors other aspects of the init script to
use variables.

So this should probably be two separate commits, or at the very least
be mentioned in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
