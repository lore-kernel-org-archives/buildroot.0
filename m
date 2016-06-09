From: Charles Hardin <ckhardin@exablox.com>
Date: Thu, 9 Jun 2016 13:58:38 -0700
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: install in the same
	location as e2fsprogs
In-Reply-To: <20160609220905.41f050b5@free-electrons.com>
References: <1464096676-41655-1-git-send-email-ckhardin@exablox.com>
 <20160525231110.648f963a@free-electrons.com>
 <20160609220905.41f050b5@free-electrons.com>
Message-ID: <45AB37CC-F067-411E-AF46-EF448E6B073F@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, there was a better submission sent which is basically make xfsprogs match the e2fsprogs which go in /usr/sbin.

I just found that highly annoying not see mkfs.ext in the same directory.

Sent from my iPhone

> On Jun 9, 2016, at 1:09 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
>> On Wed, 25 May 2016 23:11:10 +0200, Thomas Petazzoni wrote:
>> 
>>> On Tue, 24 May 2016 06:31:16 -0700, Charles Hardin wrote:
>>> The configure script hard codes "/sbin" for installation which
>>> installs the XFS tools in a different location then the e2fsprogs.
>>> 
>>> This is just a cosmetic patch so all the tools end up in "/usr/sbin"
>>> for consistency.
>>> 
>>> Signed-off-by: Charles Hardin <ckhardin@exablox.com>  
>> 
>> What is the motivation for this change? If the upstream xfsprogs
>> developers think it should be installed in /sbin, why should we change
>> it?
>> 
>> In any case, the patch itself needs a description + your Signed-off-by
>> line. Also, it should be submitted to the upstream xfsprogs developers
>> to see if they might accept it. Otherwise I think we would prefer to
>> keep the existing behavior.
> 
> Since there was no reply to my questions, I've marked this patch as
> "Rejected" in our patch tracking system. Do not hesitate to resend an
> updated version that takes into account the comments and that provides
> a more detailed justification.
> 
> Thanks for your contribution!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
