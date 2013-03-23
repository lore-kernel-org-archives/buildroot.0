From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Mar 2013 18:03:41 +0100
Subject: [Buildroot] [pull request v5] Pull request for branch
 for-master/doc
In-Reply-To: <cover.1363899518.git.s.martin49@gmail.com>
References: <cover.1363899518.git.s.martin49@gmail.com>
Message-ID: <20130323180341.238aeeef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 21 Mar 2013 22:04:31 +0100, Samuel Martin wrote:

> The following changes since commit 1f721a2f009393c29c6554f643f15f80a8dc5443:
> 
>   xinetd: follow the convention for patch location (2013-03-20 23:28:27 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/tSed/buildroot.git for-master/doc
> 
> for you to fetch changes up to 8be5fe492147513305626d9665d4119c548be11e:
> 
>   manual: update generated lists (2013-03-21 21:33:12 +0100)

I tested the current version of your branch (top commit
a368f70b7cee5ebba4d2cf6f09db08799b685af5), which contains the PATCH 6/6
that replaces the previous 6/7 and 7/7.

For the version of your branch:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I think there are still a few things that could be improved, but this
series has already been around for some time, and I'd like to see it
committed even though additional improvements may be brought to it.

Amongst the possible improvements:

 * Generate the package list files in $(O) in order to avoid having a
   compilation process that requires writing to the Buildroot source
   tree.

 * Don't use the word "stuff" for deprecated features, but instead use
   "Deprecated features".

 * Add a .gitignore entry to ignore the kconfiglib.pyc file generated
   in support/scripts/.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
