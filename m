From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Feb 2017 17:48:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-23
In-Reply-To: <20170224164608.147242c0@free-electrons.com>
References: <20170224072852.CAF2822947@mail.free-electrons.com>
 <901801527.12088604.1487934060090.JavaMail.zimbra@datacom.ind.br>
 <20170224141245.71bf2eb5@free-electrons.com>
 <3d3ce3ae-32b1-fbd2-0b27-585f600f3e31@mind.be>
 <20170224164608.147242c0@free-electrons.com>
Message-ID: <b9bba8e7-e680-92b8-b85f-a9da352cd557@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-02-17 16:46, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 24 Feb 2017 16:41:13 +0100, Arnout Vandecappelle wrote:
> 
>>  I wonder though, which distro is that autobuilder running? Debian oldstable
>> (wheezy) already has an updated wget.
> 
> I'm not sure which exact autobuilder failure Carlos was pointing to,
> but my autobuilder runs a very old squeeze Debian distro, that has this
> wget problem.
> 
> And yes, running very old squeeze Debian on my autobuilder is
> intentional :)

 Hm, squeeze was supposed to be an LTS, it got maintained until February 2016.
But it looks like wget didn't get any updates since 2010, except for a fix for
CVE-2014-4877. So bummer.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
