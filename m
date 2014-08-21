From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Thu, 21 Aug 2014 16:39:39 +0300 (IDT)
Subject: [Buildroot] [PATCH] More descriptive help text for
 usb_modeswitch
In-Reply-To: <20140821153011.4ee92142@free-electrons.com>
References: <1408557893-25786-1-git-send-email-yba@tkos.co.il>
 <20140821153011.4ee92142@free-electrons.com>
Message-ID: <alpine.DEB.2.02.1408211637210.6774@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thanks.
I'm working on a better text as per Yann's comments.
Please remind me what the line-length requirement for the help text is 
(not 80 chars?).

  - yba


On Thu, 21 Aug 2014, Thomas Petazzoni wrote:

> Date: Thu, 21 Aug 2014 15:30:11 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] More descriptive help text for usb_modeswitch
> 
> Dear Jonathan Ben-Avraham,
>
> On Wed, 20 Aug 2014 21:04:53 +0300, Jonathan Ben-Avraham wrote:
>> Improve the help text for usb_modeswitch package for the benefit of the clueless.
>>
>> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
>> ---
>>  package/usb_modeswitch/Config.in |   13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> I've applied your patch, after tweaking the commit title (it should
> always be "<package>: <something>"), rewrapping the help text to a
> shorter line length, and slightly adjusting the wording.
>
> Thanks!
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
