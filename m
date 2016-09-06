From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 6 Sep 2016 16:46:56 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.7.2
In-Reply-To: <20160906212736.520d86e9@free-electrons.com>
References: <1473170340-9594-1-git-send-email-gustavo@zacarias.com.ar>
 <20160906212736.520d86e9@free-electrons.com>
Message-ID: <226b2e83-446d-a697-b508-395413be0715@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/16 16:27, Thomas Petazzoni wrote:

> Applied to master, thanks. I was surprised you did not remove
> AUTORECONF = YES since we were patching configure.ac. But in fact,
> AUTORECONF = YES was not passed. Not sure how btrfs-progs was
> building... most likely one of its dependency has AUTORECONF = YES, so
> autoconf was guaranteed to be around.

Hi.
I've noticed the same though it didn't merit a commit note :)
Regards.
