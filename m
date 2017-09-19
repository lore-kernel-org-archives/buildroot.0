From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:59:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/luvi: needs git submodules
In-Reply-To: <1504779004.21841.17.camel@embedded.rocks>
References: <20170904053114.16477-1-bernd.kuhls@t-online.de>
 <20170906231657.382c5f79@windsurf.lan>
 <1504779004.21841.17.camel@embedded.rocks>
Message-ID: <86c02204-dc3b-22c2-ac6b-8ba957312f2b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-17 12:10, J?rg Krause wrote:
> Hello,
> 
> On Wed, 2017-09-06 at 23:16 +0200, Thomas Petazzoni wrote:
>> Hello J?rg,
>>
>> Since you are listed in the DEVELOPERS file for this package, could you
>> comment/review/ack the below patch from Bernd touching luvi ?
>>
>> Of course, git submodules and bundled libraries are not really nice,
>> which is why I'm seeking your opinion.
>>
>> Thanks!
>>
>> Thomas
>>
>> On Mon,  4 Sep 2017 07:31:14 +0200, Bernd Kuhls wrote:
>>> Luvi bundles several libraries previously provided by the upstream
>>> tarball. Since the tarball is not available anymore we need to fetch
>>> the git submodules.
> 
> I am quite sure that the maintainer simply forgot to add the release
> tarball (he already did before), that's why I opened an issue [1]
> asking for a tarball of the sources.

 Apparently there is still no tarball, so I applied to master, thanks.

 Regards,
 Arnout

> 
>>> Fixes
>>> http://autobuild.buildroot.net/results/26d/26d04350a761d362f40e7bd1ac09b639d61de91a/
> 
> Until then, we need to fetch the git submodules to fix the build issue.

[snip]

> [1] https://github.com/luvit/luvi/issues/161
> 
> Acked-by: "J?rg Krause <joerg.krause@embedded.rocks>"
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
