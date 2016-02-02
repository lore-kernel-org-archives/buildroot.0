From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 12:16:24 +0100
Subject: [Buildroot] [PATCH V3 RESEND 0/5] Add ILP32 support in aarch64
In-Reply-To: <56B089D6.4070106@huawei.com>
References: <1439428605-17453-1-git-send-email-bamvor.zhangjian@linaro.org>
 <569A60E6.2030108@gmail.com>
 <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
 <569FFB7E.2000104@gmail.com>
 <CAFy1USRK1QDrruMk+icMqELL3MtFZv8KTkDvOHZ9wrAEWNvCJg@mail.gmail.com>
 <56A4B6F0.8080108@gmail.com> <56B014A7.2070808@huawei.com>
 <56B07114.9030404@gmail.com> <56B089D6.4070106@huawei.com>
Message-ID: <56B09008.8030202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-02-16 11:49, Zhangjian (Bamvor) wrote:
> Hi, Romain
> 
> On 2016/2/2 17:04, Romain Naour wrote:
>> Hi Bamvor,
>>
>> Le 02/02/2016 03:29, Zhangjian (Bamvor) a ?crit :
[snip]
>>> You could this glibc[1]. IIRC, It is for patch v6 rfc2. We are planning to
>>> update it for patch v6 rfc5.
>>
>> Thanks for this link.
>>
>> To be honest, I don't think this series will be merged as is until a stable
>> toolchain release is made.
> What's your mean stable toolchain? A toolchain release from a organization or
> company?

 It means a release made by someone, not a random version from a git tree
somewhere. Basically something where people know where to send bug reports to.
This indeed usually means it's done by an organisation.


> Do you think it will be accepted after patch of ilp32 of kernel and glibc
> upstream?

 It doesn't necessarily mean that upstream has to have accepted it already. We
just prefer to have a release tarball.

 Regards,
 Arnout

> I am trying to improve the glibc support for ilp32 base on the exist one

>> When it's done, can you respin your series on top of
>> master since the toolchain-external code has been updated recently ?
> Yes, of course.
> 

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
