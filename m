From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:03:47 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
In-Reply-To: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151111150347.183bed23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Mon,  9 Nov 2015 10:03:31 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/libnet/Config.in |  7 +++++++
>  package/libnet/libnet.mk | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/libnet/Config.in
>  create mode 100644 package/libnet/libnet.mk

I've applied, however I had to add a hash file, since it is now
mandatory, as noticed by Arnout.

Note that there is a newer version of libnet at
https://github.com/sam-github/libnet (which seems to be the new
upstream location for the project). It would be good to use it if
possible.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
