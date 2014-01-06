From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jan 2014 13:26:38 +0800
Subject: [Buildroot] [PATCH] manual/faq: add section about why no binary
 packages
In-Reply-To: <20140106051625.GD7812@tarshish>
References: <1388954663-5692-1-git-send-email-yann.morin.1998@free.fr>
 <1388954663-5692-2-git-send-email-yann.morin.1998@free.fr>
 <20140106051625.GD7812@tarshish>
Message-ID: <20140106132638.39cd986c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 6 Jan 2014 07:16:25 +0200, Baruch Siach wrote:

> Thanks for working on this. I think it is also worth mentioning the rationale. 
> By doing source only we avoid the complexity of handling installation time 
> dependency tracking and resolution. We also don't need to track what files 
> each package installs. This makes Buildroot simpler and easier to work with.

I would go even further, and explain why tracking what files each
package installs is by far not sufficient to support binary packages.
Several people have showed up throughout the project history, willing
to add support binary packages by assuming that simply tracking which
files "make install" installs will be sufficient. But that's forgetting
all the optional dependencies problems, and various other things.

We had a write-up about this in some report of a past Buildroot
Developers Meeting, with some good arguments. Would be nice to dig that
up and summarize these arguments in the doc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
