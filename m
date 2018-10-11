From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 11 Oct 2018 17:58:08 +0200
Subject: [Buildroot] [PATCH 1/1] pigpio: depends on
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <20181011164307.47651fb4@windsurf>
References: <20181011123641.10103-1-grzegorz@blach.pl>
 <20181011164307.47651fb4@windsurf>
Message-ID: <e23e422a-1d53-50c9-edc0-858d42667921@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/18 4:43 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 11 Oct 2018 14:36:41 +0200, Grzegorz Blach wrote:
>> piogpio needs pthreads
>>
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
>> ---
>>   package/pigpio/Config.in | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Thanks for your patch. When a patch fixes a build issue detected by the
> autobuilders, we always add a reference to the autobuilder failure in
> the commit log, like this:
> 
> """
> Fixes:
> 
>    http://autobuild.buildroot.net/results/2f64c993db402decf92a5f8010033acdbc6b884f/
> """
> 
> I've fixed the commit log with this additional information before
> applying, but I wanted to let you know for your future contributions!
> 

Ok, I'll remember that.

> Thanks,
> 
> Thomas
> 
