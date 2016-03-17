From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:18:45 +0100
Subject: [Buildroot] [PATCH 13/16] elf2flt: disable Werror to avoid
 build issues
In-Reply-To: <56E9F205.6000704@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F205.6000704@mind.be>
Message-ID: <20160317091845.176e390b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 17 Mar 2016 00:53:41 +0100, Arnout Vandecappelle wrote:
> On 03/16/16 22:43, Thomas Petazzoni wrote:
> > Some of the debugging printf use incorrect formats, which cause some
> > warnings. Due to the use of -Werror by default, the build breaks
> > unnecessarily. Therefore, disable -Werror when building elf2flt.
> 
>   Wouldn't it be better to patch elf2flt to fix the errors?

Yes, indeed it is better, but one step at a time :)

Also, we generally anyway build things with -Werror disabled.

Thomas

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
