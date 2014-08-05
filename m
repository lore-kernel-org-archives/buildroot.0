From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 5 Aug 2014 16:26:40 -0500
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <20140804210403.GG3875@free.fr>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804210403.GG3875@free.fr>
Message-ID: <CAE9DZURSe+ZvKkQsnBLP6eHM7fvYhQypLDRa2Rm7rx6YMxthmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Also, if you want to have a look, I make use of those tools in my
> Buildroot.config project:
>    http://ymorin.is-a-geek.org/git/buildroot.config/

> You may want to have a look at:
>
http://ymorin.is-a-geek.org/git/buildroot.config/tree/scripts/genimages.d
> and the subfolders for how to use those tools.

Thanks Yann.  This is good stuff!  The particular challenge I have is that
I need to create and populate one vfat partition as well as one ext[2,3,4]
partition, both within the same disk image file.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140805/90e1bca9/attachment.html>
