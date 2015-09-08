From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 17:03:33 +0200
Subject: [Buildroot] [PATCH 1/1] docs/website: contribute.txt update
 with useful tips on patch versioning and patch submission
In-Reply-To: <1619019.BvyX3KbBJD@deathstar>
References: <1441718566-6551-1-git-send-email-francesco.nwokeka@gmail.com>
 <55EEE6BC.4070207@mind.be> <1619019.BvyX3KbBJD@deathstar>
Message-ID: <55EEF8C5.3000109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-15 16:57, Francesco Nwokeka wrote:
> On Tuesday 08 September 2015 15:46:36 Arnout Vandecappelle wrote:
>> On 08-09-15 15:22, Francesco Nwokeka wrote:
>>> Added an alternative on patch versioning (the -v option) and added a tip on how to automatically mark a previous commit as superseded
>>>
>>> Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
>>> ---
>>>  docs/manual/contribute.txt | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
>>> index 40579f9..1ab8ef8 100644
>>> --- a/docs/manual/contribute.txt
>>> +++ b/docs/manual/contribute.txt
>>> @@ -298,6 +298,12 @@ $ git format-patch --subject-prefix "PATCH v4" \
>>>      -M -s -o outgoing origin/master
>>>  ---------------------
>>>  
>>> +or the +-v <n>+ flag (where <n> is the version number):
>>> +
>>> +---------------------
>>> +$ git format-patch -v4 -M -s -o outgoing origin/master
>>> +---------------------
>>> +
>>
>> This option exists since git v1.8.1
> 
> Am I to specify the git version on the documentation or was it just a "fyi" statement?

 Yes, it should be mentioned in the documentation, otherwise people will try the
-v option and wonder why it doesn't work.

 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
