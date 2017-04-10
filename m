From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 14:01:35 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <20170410134549.6da2679d@free-electrons.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
 <20170406223644.473ebd65@free-electrons.com>
 <cd88fd7c-dceb-cef1-59de-e086c6b3df00@sensefly.com>
 <d0b4e258-3c24-2691-3d93-03c4f1a936e8@gmail.com>
 <33dd1db4-d5cb-3f49-931d-613dd6967b7d@sensefly.com>
 <20170410134549.6da2679d@free-electrons.com>
Message-ID: <0c54f2ff-0a60-01b1-4d3d-72356429c696@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 13:45, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for your new iteration of the libgphoto2 patch!
> 
> On Mon, 10 Apr 2017 11:24:32 +0200, Kevin JOLY wrote:
> 
>>> Also, can you check this new package with the new test-pkg script ? [3]
>>> (17.20.2. How to test your package).  
>> I ran the test. Everything was OK except br-arm-cortex-m4-full and 
>> br-arm-full-nothread.
> 
> What errors did you had with those toolchains? Did you fix those issue
> in your v2?

 I expect br-arm-cortex-m4-full runs into the elf2flt segfault, and
br-arm-full-nothread fails because it depends on threads (as mentioned in my
review).

 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
