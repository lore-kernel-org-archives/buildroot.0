From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 14:30:02 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be> <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
Message-ID: <55EED4CA.3040304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 14:14, C?dric Marie wrote:
> Hi,
> 
> Le 2015-09-07 23:14, Arnout Vandecappelle a ?crit :
>>  Don't forget to version your patches and keep a patch changelog...
> 
> I had this remark in mind - you told me some time ago - but I intended to do it
> with the patch that will handle verbosity in infrastructures. I kind of
> considered this one as a new one.
> Since the patch has been split into several patches, should I increment the
> version for every new patch?

 Yeah, that's more convenient. The goal of the version number is to make it
clear that something similar has come by before and that that previous thing is
superseded by the new thing.

> 
> 
>>  I would already have introduced the VERBOSE construct in this patch, but I
>> guess this one is less controversial, so OK.
> 
> I have tried to follow your guidelines:
> 
>> 1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial I think)
>> 2. Define VERBOSE based on V= passed on command line
>> 3. Use VERBOSE in autotools and cmake
>> 4. Update documentation.

 Oops, you're right, I proposed that myself :-) But I didn't realise that the
VERBOSE variable existed already.

> 
> 
> Do you confirm I still should send two separate patches for steps 2 and 3?

 No, since VERBOSE already exists, my proposed step 2 is useless.

 Regards,
 Arnout

> 
> Regards,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
