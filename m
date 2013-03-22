From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Mar 2013 09:23:01 +0100
Subject: [Buildroot] [PATCH 7/7] manual: update generated lists
In-Reply-To: <8be5fe492147513305626d9665d4119c548be11e.1363899518.git.s.martin49@gmail.com>
References: <cover.1363899518.git.s.martin49@gmail.com>
 <8be5fe492147513305626d9665d4119c548be11e.1363899518.git.s.martin49@gmail.com>
Message-ID: <20130322092301.6d7ef04e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 21 Mar 2013 22:04:38 +0100, Samuel Martin wrote:

>  docs/manual/deprecated-list.txt   |  77 ++-
>  docs/manual/host-package-list.txt |  22 +
>  docs/manual/package-list.txt      | 950 ++++++++++++++++++++++++++++++++++++++
>  docs/manual/pkg-list.txt          | 870 ----------------------------------

Didn't we say that the package list should *not* be committed, but
instead dynamically generated when doing "make manual" ?

So:

>  docs/manual/pkg-list.txt          | 870 ----------------------------------

is OK. But not:

>  docs/manual/package-list.txt      | 950 ++++++++++++++++++++++++++++++++++++++

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
