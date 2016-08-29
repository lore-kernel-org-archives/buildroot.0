From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 00:14:23 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <20160829120216.465dcc99@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk>
 <20160829091938.11ed7ff7@free-electrons.com>
 <87fupo6mkq.fsf@dell.be.48ers.dk>
 <20160829120216.465dcc99@free-electrons.com>
Message-ID: <cdf82b88-bcca-6fa7-a763-43f250bd6d25@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-08-16 12:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 29 Aug 2016 09:50:13 +0200, Peter Korsgaard wrote:
> 
>> Yes, but the list is really long and overwhelming. As it stands, the
>> list of packages takes up more than half the size of the manual. I think
>> just asking people to browse packages/ (or make menuconfig) is more
>> sane.
> 
> Right.

 We could replace it with a reference to http://autobuild.buildroot.net/stats/


>>  > The other thing that I find quite complex for no super benefit is the
>>  > whole "doc-asciidoc" infrastructure, but that's another story.  
>>
>> Yeah, having this infrastructure just for the manual is maybe a bit
>> overkill.

 I introduced it back in the day to reduce the size of manual.mk a little. Back
then I still believed that all code duplication is evil. Now I think that the
manual generation logic would be a lot easier to understand if it was all
unrolled...

> I agree, though some people wanted to build several manuals, if I
> remember correctly.

 I never saw the use of that, TBH. But I guess it's out there now so we should
keep it?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
