From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Jun 2017 23:08:22 +0200
Subject: [Buildroot] [PATCH] board: Add nanopi-m1 Support
In-Reply-To: <CAA4kGkrMjVABPuLYO70vutnUHG9yEct7zcWw_SyhPqyf8OpxCQ@mail.gmail.com>
References: <1497547465-15445-1-git-send-email-chakra@openedev.com>
 <e3398374-57ce-7280-0219-7625bc5396fe@mind.be>
 <CAA4kGkrMjVABPuLYO70vutnUHG9yEct7zcWw_SyhPqyf8OpxCQ@mail.gmail.com>
Message-ID: <87056b56-9d7f-3e42-6a62-778b595a4d11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-06-17 18:22, Chakra D wrote:
>>> +++ b/board/nanopi/post-build.sh
>>> @@ -0,0 +1,11 @@
>>> +#!/bin/sh
>>> +# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
>>  I don't think this is relevant anymore...
>>
> Ok will remove it. I thought post-build.sh might be needed if a specific board
> want to implement something different from normal flow.

 I meant that the comment is not relevant anymore (in particular the OrangePi part).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
