From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 13 Nov 2007 10:47:13 +0100 (CET)
Subject: [Buildroot] [buildroot 0001585]: [buildroot] Netkit package
 build fails
In-Reply-To: <36e8e3a67743697941affab0306b3022@bugs.uclibc.org>
References: <36e8e3a67743697941affab0306b3022@bugs.uclibc.org>
Message-ID: <0711131038430.7950@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Nov 2007, bugs at busybox.net wrote:

> ----------------------------------------------------------------------
>  vanokuten - 11-11-07 23:50
> ----------------------------------------------------------------------
> you did not set BR2_INET_RPC=y when building your toolchain

What about fixing package/netkitbase/Config.in to:

	select BR2_INET_RPC

thus sorting out the dependency?


Cheers,

-- 
Cristian
