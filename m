From: Fabien Marteau <fabien.marteau@armadeus.com>
Date: Wed, 20 Apr 2011 10:49:32 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
 ngircd
In-Reply-To: <BANLkTimGpTegpEY8Nx5KpGE0MjV0Dw8kQQ@mail.gmail.com>
References: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
	<BANLkTimGpTegpEY8Nx5KpGE0MjV0Dw8kQQ@mail.gmail.com>
Message-ID: <4DAE9E1C.5020305@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/2011 10:12, Daniel Nystr?m wrote:
> Oops, one last thing:
> 
>> +NGIRCD_VERSION = 17.1
>> +NGIRCD_SOURCE = ngircd-17.1.tar.gz
> 
> This should be:
> 
> +NGIRCD_VERSION = 17.1
> +NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.gz
> 
> Or, as the tarball follows standard naming convention, you could just
> strip the _SOURCE line as seen here:
> http://git.buildroot.net/buildroot/tree/package/file/file.mk
> 

Thanks for your remarks, i will commit a new version of the patch

Fabien
