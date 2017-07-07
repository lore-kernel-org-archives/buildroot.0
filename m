From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 10:21:36 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: fix build issues on older hosts
In-Reply-To: <20170707100232.0115d847@windsurf.lan>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
 <20170707100232.0115d847@windsurf.lan>
Message-ID: <a942a235-97d6-f1ab-dde6-35525bea8bbf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-17 10:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  6 Jul 2017 22:58:47 +0200, Thomas Petazzoni wrote:
>> Building the MTD test programs requires the MS_DIRSYNC, which is not
>> necessarily available on old build machines. But obviously, MTD test
>> programs are not needed, so we can simply disable them, as they were
>> prior to the migration to mtd 2.0.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1/
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  package/mtd/mtd.mk | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Patches 1 and 2 applied. Thanks Arnout for the review.

 Unfortunately you missed Baruch's comment...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
