From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Aug 2017 13:22:19 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <da69dee6-fcee-32c8-c01a-cae9f3788065@free.fr>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
 <da69dee6-fcee-32c8-c01a-cae9f3788065@free.fr>
Message-ID: <b061fd82-fa83-c7a6-a7ae-48814b615b1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-08-17 12:22, Julien Boibessot wrote:
> Hello,
> 
> Arnout,
> 
> On 10/08/2017 23:01, Arnout Vandecappelle wrote:
>>  Hi all,
>>
>>  A number of defconfigs fail to build (usually the kernel, in one case U-Boot)
>> because of GCC 6. Some of these could be fixed by simply bumping the upstream
>> kernel; however, we really want defconfigs to be tested on an actual board,
>> otherwise there's not much point.
>>
>>  I've put the people who have been involved in these defconfigs in To. Could you
>> look at these defconfigs and try to fix the build with GCC 6? Anything that
>> remains unfixed by the end of the month will probably be removed.
>>
>> ....
>>
>> armadeus_apf9328_defconfig:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568
>>
>> ...
> 
> As i.MX1 is no more (well) supported in Linux vanilla kernel and APF9328
> board is no more recommended for new projects, I think I will send a
> patch to remove this defconfig from BR.
> 
> OK for you ?

 Yes, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
