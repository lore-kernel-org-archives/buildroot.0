From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 24 Jan 2016 17:47:58 +0200 (IST)
Subject: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to
 packages menu
In-Reply-To: <20160124163827.7984d2e1@free-electrons.com>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-2-git-send-email-yba@tkos.co.il>
 <20160124160920.0fb91f86@free-electrons.com>
 <alpine.DEB.2.11.1601241724060.4122@tanhuma.tkos.co.il>
 <20160124163827.7984d2e1@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1601241743160.4122@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2016, Thomas Petazzoni wrote:

> Date: Sun, 24 Jan 2016 16:38:27 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to packages
>      menu
> 
> Dear Jonathan Ben Avraham,
>
> On Sun, 24 Jan 2016 17:33:24 +0200 (IST), Jonathan Ben Avraham wrote:
>
>> That is, one patch should look something like
>>
>>  	source "package/xinetd/Config.in"
>>  	source "package/xl2tp/Config.in"
>>  	source "package/xtables-addons/Config.in"
>>   +	source "package/yp-tools/Config.in"
>>  	source "package/znc/Config.in"
>
> This change should be part of the patch adding package/yp-tools/.
>
>> and the other should look like
>>
>>  	source "package/xinetd/Config.in"
>>  	source "package/xl2tp/Config.in"
>>  	source "package/xtables-addons/Config.in"
>>   +	source "package/ypbind-mt/Config.in"
>>  	source "package/znc/Config.in"
>
> This change should be part of the patch adding package/ypbind-mt/
>
>> And then we rely on the order of the application of the patches to
>> determine the order of the items in the final Config.in?
>
> Yes. A series is a list of patches that are ordered. They will be
> applied in the order they are listed in your series. Many series have
> patches that have dependencies between each other, that's the whole
> purpose of sending them as a series rather than independently.

Hi Thomas,
Thanks. I was not aware of the use of patch order to determine the final 
outcome and so I intentionally created a series that could be applied in 
any order and still have the desired outcome.

  - yba


> Thanks!
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
