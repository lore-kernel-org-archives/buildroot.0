From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 19:59:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] mtr: bump to version 0.86 and use
 github call
In-Reply-To: <548876B8.6060104@imgtec.com>
References: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
 <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
 <548876B8.6060104@imgtec.com>
Message-ID: <20141210195905.21b94034@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Dec 2014 16:37:12 +0000, Vicente Olivert Riera wrote:

> Also, while you are doing the version bump, why not adding a hash file
> as well:
> 
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash

Are you sure it makes sense to have hash files for github downloads?

There were some patches from Maxime Hadjinlian to remove hash files for
github-sourced packages.

Also, when you reply to someone on the list, you should reply both to
the person (as To:) and the list (as Cc:). This will make sure the
person you reply to actually sees the message, and your message is not
mixed in the fairly heavy flow of e-mails that goes through the list.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
