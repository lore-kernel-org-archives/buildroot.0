From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Feb 2017 16:41:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-23
In-Reply-To: <20170224141245.71bf2eb5@free-electrons.com>
References: <20170224072852.CAF2822947@mail.free-electrons.com>
 <901801527.12088604.1487934060090.JavaMail.zimbra@datacom.ind.br>
 <20170224141245.71bf2eb5@free-electrons.com>
Message-ID: <3d3ce3ae-32b1-fbd2-0b27-585f600f3e31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-02-17 14:12, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 24 Feb 2017 08:01:00 -0300 (BRT), Carlos Santos wrote:
>>> Build statistics for 2017-02-23  
>> [...]
>>>        host-util-linux-2.29.2 | 1  
>>
>> ERROR: certificate common name `k.ssl.fastly.net' doesn't match requested host name `cdn.kernel.org'.
> 
> This gets automatically solved by sources.buildroot.net caching the
> tarball. However, since I agree that it happens quite regularly,
> perhaps we could add some logic in autobuild-run to detect such build
> failures and ignore them?

 I wonder though, which distro is that autobuilder running? Debian oldstable
(wheezy) already has an updated wget.

 Since this problem will resolve itself pretty quickly by the updated
sources.buildroot.net, I don't think it's worth spending time in writing an
exception in the autobuild-run script.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
