From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 19:05:46 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <72b10dae-a067-66dc-4e7e-cc43193d2527@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
 <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
 <a8c548d5-d6d0-53bf-2c6b-17e5a5f3101b@mind.be>
 <75ca9a71-aaf5-dd21-f71f-4bcfc2880faa@grandegger.com>
 <6994b7c9-7714-4941-8efc-ffb31f1adbb1@mind.be>
 <ee017453-259f-5e1c-0028-9d3b51b21376@grandegger.com>
 <fae9da71-f806-a64f-042a-dbf3e9c0d068@mind.be>
 <72b10dae-a067-66dc-4e7e-cc43193d2527@grandegger.com>
Message-ID: <23227ea3-18e1-2543-f551-98bf39d29923@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 18:50, Wolfgang Grandegger wrote:
> 
> 
> Am 20.07.2017 um 16:19 schrieb Arnout Vandecappelle:
[snip]
>>   OK good. Might be a good idea to keep track of the things you already tried in
>> the cover letter.
> 
> Well, it's already a few month ago that I tried finding a good and fast
> solution. I tried a lot of things, be can't remember the details. 

 That's exactly why I ask to keep track of it in the cover letter. :-)

 Since you already posted the series, no need to do it now. But when you post
patches that speed things up, please try to write down what you tested (at least
the things that you are sure of).

 Regards,
 Arnout

> My time
> working on this topic is limited! When I have more free time I will take care.
> 
> Wolfgang.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
