From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2013 21:49:21 +0200
Subject: [Buildroot] Issue with the autobuilders: removing 1379 builds
 from the history?
In-Reply-To: <20130528214729.6a3669e2@skate>
References: <20130528091052.16da9159@skate> <51A50964.7090503@mind.be>
 <20130528214729.6a3669e2@skate>
Message-ID: <51A50A41.30103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/05/13 21:47, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 28 May 2013 21:45:40 +0200, Arnout Vandecappelle wrote:
>
>>    I would wait a couple of days before removing them. At least for the
>> most recent ones, current HEAD probably still exposes the same problem,
>> so in that sense the build result is still usable.
>
> Ok. I'm not sure they are really usable, but ok.

  I usually don't look at the commit ID when reproducing an autobuilder 
failure. If I haven't seen a related patch on the list, I'm pretty sure 
it will still fail.


>>    Would it be possible to direct the URLs to a placeholder page
>> explaining that the build result was removed, so existing links in commit
>> messages don't die?
>
> Yes, I can keep the output directories around, wipe-out their contents,
> and replace it with just a README.txt file that says it has been
> removed and why. Would this be ok for you?

  Perfect!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
