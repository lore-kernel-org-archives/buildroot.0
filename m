From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 11:57:49 +0100
Subject: [Buildroot] Iputils not setting suid root?
In-Reply-To: <CABhNV23FhwkRdDwmNimoeKa++i3vQbErgVHg_8fUG_SWWi-Z=Q@mail.gmail.com>
References: <CABhNV21G9hPsHpATOeXUnyPuCpT71XGhVsgXW_Uniq88WUuqSQ@mail.gmail.com>
 <20180112105022.6ef14d5c@windsurf.lan>
 <CABhNV23FhwkRdDwmNimoeKa++i3vQbErgVHg_8fUG_SWWi-Z=Q@mail.gmail.com>
Message-ID: <20180112115749.1fee6110@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 11:54:40 +0100, Einar J?n wrote:

> > That's a bug. Could you submit a proper patch that fixes this ?
> >  
> 
> Attached one below, done against current master (84e835e)
> I hope that's the way you want it.

It is almost good :)

Things to adjust:

 - We need your Signed-off-by at the end of the commit log.

 - Please send the patch inline, using "git send-email". This makes
   review easier, and allows our patchwork tracking tool
   (http://patchwork.ozlabs.org/project/buildroot/list/) to properly
   record the patch.

 - You could slightly tweak the commit log, with something like: "The
   ping and traceroute6 programs need to be SUID-root to work
   correctly."

Could you fix those minor details and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
