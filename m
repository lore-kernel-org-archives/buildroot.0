From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Nov 2019 17:18:41 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
In-Reply-To: <20191118171154.57c7f978@windsurf.home>
References: <20191116091004.23726-1-yann.morin.1998@free.fr>
 <b074a89e-682a-76a1-d704-36fb0634311b@mind.be>
 <20191118171154.57c7f978@windsurf.home>
Message-ID: <552cedc4-2981-9681-09d5-4a47377eeb31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/11/2019 17:11, Thomas Petazzoni wrote:
> On Sun, 17 Nov 2019 15:41:59 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> +	  Set to empty to not install a default time zone.  
>>
>>  Maybe we should then also change the default to empty? Then at least this use
>> case gets tested in the autobuilders. Oh, maybe adding a few possible values for
>> this config in genrandconfig would be nice as well...
> 
> I think this kind of feature gets better tested by having runtime
> tests, which can specifically test the interesting configurations.

 I didn't express myself very well...

 The change default to empty was independent of the testing. I just thought that
it makes more sense to not install a default timezone than to install UTC as
default (net result is equivalent, but semantically no timezone makes more sense
IMO).

 And then I thought: that's nice, that way the feature also gets tested in the
autobuilders.

 Regards,
 Arnout
