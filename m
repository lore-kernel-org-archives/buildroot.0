From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Jun 2016 21:44:40 +0200
Subject: [Buildroot] [PATCH v3 2/5] package/efl: bump to 1.17.2
In-Reply-To: <20160626213356.1a344560@free-electrons.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
 <1466630866-28779-2-git-send-email-romain.naour@gmail.com>
 <20160626213356.1a344560@free-electrons.com>
Message-ID: <2de78819-c330-d889-16c8-9d1089662e66@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/06/2016 ? 21:33, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed, 22 Jun 2016 23:27:43 +0200, Romain Naour wrote:
> 
>> -	select BR2_PACKAGE_LUAJIT # Lua support broken with 5.2+
>> +	select BR2_PACKAGE_LUAJIT # Lua support broken
> 
> This change really belongs with the first patch, so I moved it to the
> first patch, for consistency.

I meant that the Lua support is not entirely broken with efl 1.15 and completely
broken since 1.16. But ok :)

Tanks for merging the series, I'll monitor the autobuilders to fix build failure
(if any) before sending the next one.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
