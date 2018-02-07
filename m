From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 00:45:49 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: bump to 1.28.0
In-Reply-To: <20180207182640.eoqb3azybouhpp7s@tarshish>
References: <20180207145215.19465-1-aduskett@gmail.com>
 <20180207145915.pxmyc7ggfscxkpxs@sapphire.tkos.co.il>
 <CAFSsvmpxvze6Q5MNzbebkrGMkg50QscTEcQBqL+t_K53ZCAV_Q@mail.gmail.com>
 <20180207182640.eoqb3azybouhpp7s@tarshish>
Message-ID: <9548daaa-f14b-024e-0b9e-38f4b85a6e8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-02-18 19:26, Baruch Siach wrote:
> Hi Adam,
> 
> On Wed, Feb 07, 2018 at 10:30:48AM -0500, Adam Duskett wrote:
>> On Wed, Feb 7, 2018 at 9:59 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>>> On Wed, Feb 07, 2018 at 09:52:15AM -0500, Adam Duskett wrote:
>>>> Other changes:
>>>>  - Update 0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
>>>>    for 1.28.0
>>>>  - Remove upstream patches 3, 4, and 5.
>>>>  - Update buxybox.config and busybox-minimal.config
>>>
>>> Also fixes CVE-2017-15873 (upstream commit 0402cb32d), and CVE-2017-15874
>>> (upstream commit 9ac42c500586).
>>
>> I didn't catch that! Thanks!
>> Should I resubmit?
> 
> I don't think so. The maintainers would probably fix that while applying.

 On the other hand, if you *do* resubmit, that will save the maintainers a
little time.

 Bottom line: it's fine if you don't, it's nice if you do.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
