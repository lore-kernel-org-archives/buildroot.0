From: Martin Bark <martin@barkynet.com>
Date: Tue, 3 May 2016 09:38:13 +0100
Subject: [Buildroot] [PATCH 1/5] package/nginx: bump version to 1.10.0
In-Reply-To: <20160501234101.1f4b6c8d@free-electrons.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
 <20160501234101.1f4b6c8d@free-electrons.com>
Message-ID: <CAFGQKxcdTMoaPLgV8ZrfUYqFFEPtXQZqvi5Ldi1qjBmHUAGP7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 1 May 2016 at 22:41, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun,  1 May 2016 20:52:21 +0100, Martin Bark wrote:
>
>>  # mail modules
>>  ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
>> +NGINX_CONF_OPTS += --with-mail
>
> Is this directly related to the bump?

I just tested 1.8.1 and it seems enabling BR2_PACKAGE_NGINX_MAIL does
not cause the mail modules to get built.  So --with-mail is missing
from the existing 1.8.1 code too.  Do you want me to split this into a
separate patch and resubmit?

Thanks

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
