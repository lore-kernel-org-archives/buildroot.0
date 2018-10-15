From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Oct 2018 14:27:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-14
In-Reply-To: <CAMo8Bf+c9cYqa_rduvsVHCrVrXC_8-6mt-B0-TLHJRmboHU3JQ@mail.gmail.com>
References: <20181015060028.2292320728@mail.bootlin.com>
 <CAMo8Bf+c9cYqa_rduvsVHCrVrXC_8-6mt-B0-TLHJRmboHU3JQ@mail.gmail.com>
Message-ID: <9915a014-ce86-223b-a2bd-329797e2c948@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/10/18 09:31, Max Filippov wrote:
> On Sun, Oct 14, 2018 at 11:00 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>       xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/586adbd49ca1deb8116f2da04ab04069f3048536 | ORPH
> 
> Has the following in the build-end.log:
>> collect2: error: ld returned 1 exit status
>> Makefile:108: recipe for target 'imagescaling' failed
>> make[4]: *** [imagescaling] Error 1
> 
> so I took a look at it, but surprisingly I couldn't reproduce it.

 Qt4 is on its way to deprecation, so feel free to just make it depend on !xtensa.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
