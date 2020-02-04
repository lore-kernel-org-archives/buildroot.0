From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Feb 2020 15:36:01 +0100
Subject: [Buildroot] [PATCH v2] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
In-Reply-To: <20200204110416.074754d8@windsurf>
References: <20200204095059.7315-1-giulio.benetti@benettiengineering.com>
 <20200204110416.074754d8@windsurf>
Message-ID: <b1fbe4c2-03eb-9c45-484d-043a2f7b60b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/02/2020 11:04, Thomas Petazzoni wrote:
> On Tue,  4 Feb 2020 10:50:59 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Since all architectures supported by Buildroot are supported by libnspr
>> BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT makes no sense anymore, so let's remove
>> it all around.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Arnout and I both agreed that we want to keep this blind option, so I'm
> not sure I understand why you're sending this patch. Did we miss something?

 Actually, Giulio replied that in the other thread (but it should be part of the
commit log here, maybe): adding architecture support is trivial (just a matter
of defining the right sizes), so we should never need to re-add this option.
Just fix libnspr.

 Regards,
 Arnout
