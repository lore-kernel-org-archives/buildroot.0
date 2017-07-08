From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 17:20:02 +0200
Subject: [Buildroot] ARM cross compiler path error "no such file or
 directory"
In-Reply-To: <732f5ed8-6ba1-96eb-8a19-1c15e87eecc2@cartelsol.com>
References: <5ea74359-6a01-7668-c1d2-3784711227ab@newflow.co.uk>
 <20170706173509.5181f14d@windsurf.lan>
 <da907d83-16e4-4b89-6d4b-db3d686a2a85@mind.be>
 <732f5ed8-6ba1-96eb-8a19-1c15e87eecc2@cartelsol.com>
Message-ID: <024416e4-4afa-74aa-111c-c008b2ad73ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-17 16:08, Marcus Hoffmann wrote:
> Hey Arnout,
> 
> On 06.07.2017 23:50, Arnout Vandecappelle wrote:
[snip]
>>  You need to rebuild the toolchain (actually the toolchain wrapper) after this
>> change. And probably other things need to be rebuilt as well. To be safe, do a
>> "make clean; make".
> 
> Now I wonder, is there any difference to doing "make clean all"?

 That should indeed be the same.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
