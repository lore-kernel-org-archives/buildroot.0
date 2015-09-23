From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 14:07:03 +0100
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
In-Reply-To: <20150923150354.70f6b27a@free-electrons.com>
References: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150923150354.70f6b27a@free-electrons.com>
Message-ID: <5602A3F7.9000605@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/23/2015 02:03 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 23 Sep 2015 12:57:59 +0100, Vicente Olivert Riera wrote:
>> rtptools needs a toolchain with RPC support, otherwise it will fail with
>> an error message like this one:
>>
>> host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
>>  #include <rpcsvc/ypclnt.h>   /* YP */
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I'm surprised we have not seen autobuilder failures. Or did you forget
> to include a reference to an autobuilder error?

No, I didn't forget that. I have catch this issue with one local
autobuilder I have. If you wonder why I have a local autobuilder instead
of submitting the results to the ML, it's because that autobuilder uses
toolchains that are not yet included in our Buildroot tree.

Regards,

Vincent.

> 
> Thanks!
> 
> Thomas
> 
