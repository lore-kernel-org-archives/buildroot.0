From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 17:52:17 +0100
Subject: [Buildroot] [PATCH 2/4] docs/website: html cleaning and
 indentation fixing
In-Reply-To: <56631601.4000708@mind.be>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
 <1449213674-11333-3-git-send-email-angelo.compagnucci@gmail.com>
 <56631601.4000708@mind.be>
Message-ID: <56631641.40207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-12-15 17:51, Arnout Vandecappelle wrote:
> On 04-12-15 08:21, Angelo Compagnucci wrote:
>> * Fixing indentation and cleaning with html tidy
>> * Adding tidy_config.txt containing tidy settings
> 
>  I guess this patch is completely automatic. In that case you should definitely
> give the exact command used to create it. Perhaps even add tidy_config.txt in a
> separate patch so this one becomes really just automatic changes.

 I just noticed, there is some end-of-line whitespace introduced by this patch.
Does tidy really do that?

 Regards,
 Arnout

> 
>  Assuming it is an automatic change, you can add my
>  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  Regards,
>  Arnout
> 
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
