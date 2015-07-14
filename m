From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 09:44:50 +0200
Subject: [Buildroot] [PATCH 1/1] Fix npm module cross compilation,
 use up-to-date npm and install modules globally
In-Reply-To: <1436858924.2564.14.camel@posteo.de>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
 <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
 <20150713000915.3df608e2@free-electrons.com>
 <1436858924.2564.14.camel@posteo.de>
Message-ID: <20150714094450.49189293@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 14 Jul 2015 09:28:44 +0200, J?rg Krause wrote:

> I replied to the patch on 15 Dec 2014 [1], but the mail was not added
> to the thread.
> 
> In short: The patch does not work as intended.
> 
> There was indeed an issue with cross-compilation for certain modules
> (eg serialport) which was fixed by Martin Bark [1].
> 
> I would suggest to mark this patch as Rejected.

Thanks a lot for the feedback! We already marked the patch as Changes
Requested, which makes it no longer visible to us in the list of
pending patches, so that's good enough.

Again, thanks for the feedback.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
