From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 17:43:50 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <52752722.5060107@zacarias.com.ar>
References: <1382460400-3205-1-git-send-email-gustavo@zacarias.com.ar>
 <20131102144355.0a980960@skate> <52752722.5060107@zacarias.com.ar>
Message-ID: <20131102174350.05deaa50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 02 Nov 2013 13:24:02 -0300, Gustavo Zacarias wrote:
> On 11/02/2013 10:43 AM, Thomas Petazzoni wrote:
> 
> > For some reason, this patch was not in patchwork, not sure what
> > happened, since I don't see it having been applied on master by Peter,
> > unless I missed something.
> 
> Patchwork is acting up a little sometimes, for instance some patches
> that were applied by Peter were never marked as accepted (for instance
> the libpng disable tools patch IIRC).

This is expected when Peter makes a small modification to the patch:
patchwork no longer recognizes the committed patch as being the same as
the patch sitting in the queue.

However, a patch not committed and not visible in patchwork is a bit
weird (except for patches that only rename files, because the patch
contents are empty and patchwork doesn't understand that).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
