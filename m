From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:42:04 +0200
Subject: [Buildroot] [PATCH 1/2] memcached: bump to version 1.5.6
In-Reply-To: <20180302180756.14315-1-chrismcc@gmail.com>
References: <20180302180756.14315-1-chrismcc@gmail.com>
Message-ID: <20180402114204.3bbac3b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Mar 2018 10:07:55 -0800, Christopher McCrory wrote:
> From ReleaseNotes156
> 
> This is a bugfix release, but it primarily disables the UDP protocol by
> default.
> 
> In the last few days reports of UDP amplification attacks utilizing
> inesure memcached instances have surfaced. Attackers are able to set
> large values into memcached, then send requests via spoofed UDP packets.
> Memcached will then send a very large number of very large UDP packets
> back in response.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/memcached/memcached.hash | 7 +++----
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
