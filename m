From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 07:39:32 +0100
Subject: [Buildroot] [PATCH 6 of 8] manual: contributing: minor
 rewording of 'submitting patches' section
In-Reply-To: <20140305172647.GF5066@free.fr>
References: <patchbomb.1394036666@argentina>
 <e71bbcb3a276227ed93f.1394036672@argentina> <20140305172647.GF5066@free.fr>
Message-ID: <53181824.7040508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 18:26, Yann E. MORIN wrote:
> Thomas, All,
> 
> Not directly related to your patch...
> 
> On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
>> @@ -236,7 +238,7 @@ Hereafter the recommended layout:
>>  ---------------
>>  Patch title less than 80-character length
>>  
>> -Some more paragraph giving some more details.
>> +A paragraph giving more details.
>>  
>>  And yet another paragraph giving more details.
> 
> I like it when commit log are describing what the problem is, what the
> reason is, and how it is solved. Something like:
> 
>     Patch title: short explanation, less than 80 chars

 Actually, everything should be wrapped at 72 chars, since 'git log'
indents with a tab.


 Regards,
 Arnout

> 
>     A paragraph that explains the problem, and how
>     it manifests itself. If the problem is complex,
>     it is OK to add more paragraph.
> 
>     A paragraph that explains the root cause of the problem.
>     Again, more than on paragraph is OK.
> 
>     Finally, a paragraph than explains how it is solved.
>     
>     Signed-off-by: John DOE <john.doe@example.net>
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
