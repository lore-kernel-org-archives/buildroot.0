From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 4 Aug 2015 12:24:29 +0300 (IDT)
Subject: [Buildroot] [PATCH v2 1/1] dawgdic: new package
In-Reply-To: <20150804111848.4e6c8402@free-electrons.com>
References: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
 <20150804111848.4e6c8402@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1508041223140.1726@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thanks.
Hold off on the other patches that I submitted. Baruch will provide 
feedback on what needs to be done and I will do the work myself from now 
on.

  - yba


On Tue, 4 Aug 2015, Thomas Petazzoni wrote:

> Date: Tue, 4 Aug 2015 11:18:48 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH v2 1/1] dawgdic: new package
> 
> Dear Jonathan Ben-Avraham,
>
> On Mon,  3 Aug 2015 12:16:03 +0300, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> The dawgdic package provides object files and utilities for building and
>> accessing directed acyclical word graph (DAWG) dictionaries.
>>
>> This version of the patch uses the updated GitHub dawgdic repo instead of the
>> Google Code repo used in the previous version of this patch.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>
> Patch applied, but I had to do quite a bit of changes:
>
>    [Thomas:
>      - use the github macro for <pkg>_SITE
>      - remove <pkg>_SITE_METHOD, useless once you use the github macro
>        for <pkg>_SITE
>      - fix the license, it is BSD-3c and not GPLv3
>      - remove commented <pkg>_SITE in the .mk file
>      - add missing dependency on C++.]
>
> Thanks!
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
