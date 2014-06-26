From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 15:05:57 -0300
Subject: [Buildroot] [PATCH] bmon: bump to version 3.2
In-Reply-To: <20140626175824.GW4155@tarshish>
References: <1403804911-29110-1-git-send-email-gustavo@zacarias.com.ar>
 <20140626175824.GW4155@tarshish>
Message-ID: <53AC6105.4050905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/2014 02:58 PM, Baruch Siach wrote:

> Shouldn't this be
> 
> 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
> 
> ?

Hi, thanks yes, all these legal info checks are making my eyes bleed.
I'll spin v2.
Regards.
