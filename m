From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 12:25:37 +0000
Subject: [Buildroot] [PATCH] nano: bump version to 2.7.5
In-Reply-To: <20170313122132.7vx3gfmhqmpvtkgf@tarshish>
References: <20170313115030.16340-1-Vincent.Riera@imgtec.com>
 <20170313122132.7vx3gfmhqmpvtkgf@tarshish>
Message-ID: <d9c6d970-faef-2cc1-9945-a2f228ec9f6d@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 13/03/17 12:21, Baruch Siach wrote:
> Hi Vicente,
> 
> On Mon, Mar 13, 2017 at 11:50:30AM +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> [snip]
> 
>>  NANO_VERSION_MAJOR = 2.7
>> -NANO_VERSION = $(NANO_VERSION_MAJOR).4
>> +NANO_VERSION = $(NANO_VERSION_MAJOR).5
> 
> A similar bump has recently been reverted (commit 850722fc68a16) because of 
> musl build issues.

oops, thanks for the info. Marking this one as rejected.

Vincent

> 
> baruch
> 
