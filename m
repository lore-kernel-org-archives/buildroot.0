From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:18:07 +0100
Subject: [Buildroot] [PATCH 12/16] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <56E9F163.5080304@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F163.5080304@mind.be>
Message-ID: <20160317091807.4924cfcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 17 Mar 2016 00:50:59 +0100, Arnout Vandecappelle wrote:
> On 03/16/16 22:43, Thomas Petazzoni wrote:
> > The uClinux developers now have a Github with elf2flt code, with an
> > upstream that is again active. Let's switch to this upstream, to which
> > Waldemar is contributing as well.
> 
>   While at it, you could have added a hash file.

Will do.

> > We also add an ARM patch from Waldemar, which was on his elf2flt
> > repository and he submitted upstream.
> 
>   That probably should have been a separate patch.

No: the Waldemar Git repository did contain the ARM noMMU support. So
when switching to the more "official" upstream (which doesn't yet have
ARM noMMU support), we need to include the patch adding ARM noMMU
support to keep functionality the same.

I guess I should have made that explicit in the commit log, to avoid
confusion.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
