From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 00:24:21 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <5579FB8D.1020509@openmailbox.org>
References: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>	<5578AFEC.4020107@mind.be>	<339271dfef37197a3b13ecbd8222c28a@openmailbox.org>
 <5579F071.40802@mind.be> <5579FB8D.1020509@openmailbox.org>
Message-ID: <557A0A95.7020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 23:20, C?dric Marie wrote:
> Hi,
> 
> Le 11/06/2015 22:32, Arnout Vandecappelle a ?crit :
>>   Yes, but I was in fact mainly talking about the help text of the new option.
> 
> Oops, sorry.
> But I suppose I shouldn't give so much details in the help text, as in the
> commit message.
> What do you think is important to mention?
> 
> Here is a proposal, feel free to comment/modify:
> 
> Compile DirectFB with debugging support. It provides functions to print debug
> information, for DirectFB as well as external DirectFB drivers.
> When disabled, DirectFB has got no debug feature at all, and the directory that

When disabled, DirectFB does not print any debug information. The drivers will
be installed to and loaded from /usr/lib/directfb-<version>-pure instead of
/usr/lib/directfb-<version>-.

> contains the internal libraries is suffixed with -pure
> (/usr/lib/directfb-<version>-pure/).
> 
> 
> NB: I'm not really satisfied with "internal libraries", but I can't find the
> right expression for that. It contains gfx drivers, but not only...

 gfx drivers, input drivers, window systems drivers, ... I think it's drivers
:-) Only interfaces doesn't fit.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
