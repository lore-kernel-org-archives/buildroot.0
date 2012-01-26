From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jan 2012 22:20:47 +0100
Subject: [Buildroot] [PATCH 03/13] libraw1394: bump to version 2.0.7
In-Reply-To: <1327596692-30728-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jan 2012 13:51:22 -0300")
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
 <1327596692-30728-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bopqduts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libraw1394/Config.in     |    9 +++------
 Gustavo>  package/libraw1394/libraw1394.mk |    8 ++++----
 Gustavo>  2 files changed, 7 insertions(+), 10 deletions(-)

 Gustavo> diff --git a/package/libraw1394/Config.in b/package/libraw1394/Config.in
 Gustavo> index 49399e3..0b7e280 100644
 Gustavo> --- a/package/libraw1394/Config.in
 Gustavo> +++ b/package/libraw1394/Config.in
 Gustavo> @@ -1,10 +1,7 @@
 Gustavo>  config BR2_PACKAGE_LIBRAW1394
 Gustavo>  	bool "libraw1394"
 Gustavo>  	help
 Gustavo> -		Library for direct access to IEEE 1394 bus.
 Gustavo> +		libraw1394 provides direct access to the IEEE 1394 bus through
 Gustavo> +		the Linux 1394 subsystem's raw1394 user space interface. 
 
 Gustavo> -		Through libraw1394/raw1394, applications can directly
 Gustavo> -		send to and receive from other nodes without requiring
 Gustavo> -		a kernel driver for the protocol in question.
 Gustavo> -

Indentation is wrong, but I'll fix that up.

-- 
Bye, Peter Korsgaard
