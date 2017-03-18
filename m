From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 14:17:55 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <20170318114209.123e1ea8@free-electrons.com>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
 <20170302225441.5adee9f6@free-electrons.com>
 <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
 <20170317171427.03270127@free-electrons.com>
 <04a224aa-c599-d927-79ad-869dcd7d9f7c@mind.be>
 <20170318114209.123e1ea8@free-electrons.com>
Message-ID: <c221a49f-cbf8-afc0-7acc-96ef7cf242e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 11:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 17 Mar 2017 23:17:25 +0100, Arnout Vandecappelle wrote:
> 
>>  I wouldn't say "regularly". I do look occasionally. I would pay a lot more
>> attention if I got an occasional personal mail.
> 
> OK. But it probably wouldn't be "occasional". From a quick look, we
> have currently ~500 packages not associated to a developer, so about
> 1/4 of all packages we have.
> 
> But currently, we indeed don't notice when there is a build failure on
> a package that is orphaned. Having at least you notified on orphaned
> packages build failures would raise the attention on this or that
> package being orphaned, and then we can see what needs to be done: find
> if someone has been active on that package recently and is willing to
> adopt it, remove the package if it's too broken and nobody cares, etc.
> 
> What do you think?

 Sounds good! Will you work on the getdeveloper script?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
