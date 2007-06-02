From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 02 Jun 2007 11:40:10 +0100
Subject: [Buildroot] ALSA tools for build-root
In-Reply-To: <20070602102614.GK12010@aon.at>
References: <46613FBE.7080709@teamboyce.co.uk> <20070602102614.GK12010@aon.at>
Message-ID: <4661490A.1080907@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Sat, Jun 02, 2007 at 11:00:30AM +0100, Rod Boyce wrote:
>   
>> All,
>>     
>
>   
>> +$(foreach var,$(ALSA-TOOLS_TGTS),$(eval $(call alsa-mk_target,$(var))))
>>     
>
> I think that creating rules with a define was horribly broken with
> anything older than make-3.81
>
> Did you test these changes against make-3.80, which is the oldest
> version that is currently needed to use buildroot?
>
>   
Bernhard,

I cannot believe my luck but the output from make --version on my 
development machine is:

[rod at celeron root]$ make --version
GNU Make 3.80
Copyright (C) 2002  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.


So I guess that means I have tested this on 3.80 :-) 8-) :-)


Regards,
Rod Boyce
