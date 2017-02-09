From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 09:40:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/bluez-tools: new package
In-Reply-To: <20170209073106.6cxmljtlkz7moxjh@tarshish>
References: <20170208213255.6511-1-bernd.kuhls@t-online.de>
 <20170209073106.6cxmljtlkz7moxjh@tarshish>
Message-ID: <20170209094041.14d1a05e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Feb 2017 09:31:06 +0200, Baruch Siach wrote:

> >  DEVELOPERS                           |  1 +  
> 
> This change should be in a separate patch.

Actually, our Buildroot manual says otherwise, so we discussed this at
the Buildroot Developers meeting earlier this week. The conclusion of
this discussion is that we in fact prefer to have the change to the
DEVELOPERS file in the same patch as the patch adding the package.

We believe that having separate patches really adds additional burden,
and increases the chance of merging a new package without the
corresponding change to the DEVELOPERS (for example if someone submits
a series adding N packages, just one patch updating the DEVELOPERS
file, and we merge only the first few packages because the remaining
ones are not yet ready).

Separating the change to DEVELOPERS file is actually causing more
effort than the effort that will be required by the few people who will
backport patches and have to handle a few conflicts in the DEVELOPERS
file.

So we now prefer to have the DEVELOPERS file change in the patch adding
the package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
