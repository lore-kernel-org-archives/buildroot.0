From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Nov 2014 14:05:43 +0100
Subject: [Buildroot] [PATCH 1/1] uclibc/ffmpeg: Fix fminf-related build
	error
References: <1411479699-16331-1-git-send-email-bernd.kuhls@t-online.de>
 <20141005234010.17ab13c5@free-electrons.com>
 <XnsA3BEDA4F21A53berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141030230535.4d6673bd@free-electrons.com>
Message-ID: <XnsA3E08F6239BCDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20141030230535.4d6673bd at free-electrons.com: 

> Dear Bernd Kuhls,
> 
> On Mon, 06 Oct 2014 21:27:38 +0200, Bernd Kuhls wrote:
>> [posted and mailed]
>> 
>> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
>> @public.gmane.org> wrote in
>> news:20141005234010.17ab13c5-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8 at public.gma
>> ne.org: 
>> 
>> > Do you think we could have a solution that combines keeping the
>> > ffmpeg fminf() patch, and adding the uClibc patch?
>> 
>> Hi,
>> 
>> I will investigate, but it will take several days for me to do so.
>> Meanwhile I will send the next ffmpeg version bump now ;)
> 
> Any progress on this issue?

Hi Thomas,

yes, upstream fixed the issue yesterday!
http://patchwork.ozlabs.org/patch/408557/

Regards, Bernd
