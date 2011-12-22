From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 12:32:33 +0100
Subject: [Buildroot] Buildroot & GIT branch
In-Reply-To: <CAAXf6LVb=h2rObnfJ8RBncyrwo5cONuvDi5c83PaDCbKTxKBWw@mail.gmail.com>
References: <DUB105-W30E0FD52CE9490FC698A25CDAA0@phx.gbl>
 <CAAXf6LVb=h2rObnfJ8RBncyrwo5cONuvDi5c83PaDCbKTxKBWw@mail.gmail.com>
Message-ID: <20111222123233.6d6b7c4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Dec 2011 12:19:40 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I think you should put the branch name as Linux kernel version in the
> configuration.

Right. Something like:

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://myserver.com"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="mybranch"

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
