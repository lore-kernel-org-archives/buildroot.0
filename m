From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Oct 2015 09:41:52 +0100
Subject: [Buildroot] [PATCHv4] gdb: prevent building the documentation
In-Reply-To: <20151001091137.4bc06d8a@free-electrons.com>
References: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151001091137.4bc06d8a@free-electrons.com>
Message-ID: <560CF1D0.3090608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Romain,

On 10/01/2015 08:11 AM, Thomas Petazzoni wrote:
> Vicente, Romain,
> 
> On Thu, 10 Sep 2015 09:56:40 +0100, Vicente Olivert Riera wrote:
>> Force gdb to not build the documentation. This way we avoid depending on
>> host-texinfo. This is a temporary fix until upstream accepts a proposed
>> --disable-docs configure option.
>>
>> Since the documentation will not be build at all, we can remove the
>> parts related to host-texinfo and MAKEINFO in the gdb.mk file.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Tested-by: Brendan Heading <brendanheading@gmail.com>
> 
> Seems like this is not yet working completely for all situations:
> 
>    http://autobuild.buildroot.org/results/244/2442e697d8a300496434fd42fcb1ee3941d13e06/build-end.log

I will have a look.

Romain, how is going the upstream request about the --disable-docs option?

Regards,

Vincent.

> Best regards,
> 
> Thomas
> 
