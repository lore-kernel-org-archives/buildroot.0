From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 19:41:45 +0200
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <1379568660.27759.4.camel@viko>
References: <201309182118.23091.fatih.asici@gmail.com>
 <20130919062450.10f51848@skate> <1379568660.27759.4.camel@viko>
Message-ID: <523B3759.1000901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 07:31, Fatih A??c? wrote:
> On Thu, 2013-09-19 at 06:24 +0200, Thomas Petazzoni wrote:
>>>>> -@@ -0,0 +1,43 @@
>>>>> +@@ -0,0 +1,44 @@
>>>>>
>>>>>   +MAKEFILE_GENERATOR      = UNIX
>>>>>
>>>>> -+CONFIG                  += incremental gdb_dwarf_index
>>>>> ++CONFIG                 += incremental gdb_dwarf_index
>>>>
>>>> Is this change needed? Seems like white space change only, no?
>>>
>>> I checked the mkspec files in old and new versions of upstream.
>> Upstream's
>>> files have this change. So I changed our mkspec file to reduce diff
>> output.
>>> I think, this will help checking again in new versions. Yes, it is
>> only
>>> a white space change and not needed.
>>
>> It's a bit early, so maybe my brain is not yet up and running, but if
>> the upstream has changed this, and we don't care about whether there's
>> a space or not, why does our patch contains something to change this?
>
> It is just a cosmetic change not to see the difference when comparing
> files :)
>
> If the rule is not to touch anywhere unrelated to the version change, I
> can revert that part.

  I think it's a good idea to keep it. The closer that our mkspecs stays 
to one of the upstream examples, the better.

  Perhaps we could try upstreaming our mkspecs? Does that make sense?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
