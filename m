From: Robert Carter <r.carter@cs.auckland.ac.nz>
Date: Thu, 9 Nov 2006 14:41:37 +1300
Subject: [Buildroot] [patch] netcat package
In-Reply-To: <01db01c70391$4688cc20$01c4af0a@atmel.com>
References: <1163028614.26543.2.camel@turing>
	<01db01c70391$4688cc20$01c4af0a@atmel.com>
Message-ID: <58FE83AD-EB8B-43FA-BD44-7F55645DF0BC@cs.auckland.ac.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, it is better that way. Updated patch attached.

Rob

-------------- next part --------------
A non-text attachment was scrubbed...
Name: netcat.patch
Type: application/octet-stream
Size: 3158 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061109/3ece2182/attachment.obj 
-------------- next part --------------

On 9/11/2006, at 12:37 PM, Ulf Samuelsson wrote:

> Robert Carter wrote:
>>> Here is a patch to add the netcat package to buildroot.
>
> Why not separate the package version from the package name?
>
> +NETCAT_VER:=0.7.1
> +NETCAT_SOURCE:=netcat-$(NETCAT_VER).tar.gz
> +NETCAT_SITE:=http://osdn.dl.sourceforge.net/sourceforge/netcat
> +NETCAT_DIR:=$(BUILD_DIR)/netcat-$(NETCAT_VER)
>
> Best Regards,
> Ulf Samuelsson
>
