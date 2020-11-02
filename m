From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Nov 2020 06:06:07 -0600
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc
 2.31
In-Reply-To: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
References: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
Message-ID: <CANQCQpZ5xzOATqBxQrJRhR159LuwFA37eYuK2keTiS=fNzutKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter / Thomas / Yann / Arnout,


On Thu, Oct 29, 2020 at 9:04 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Peter,
>

[snip]

> Note: I'll have additional individual patches coming for openssh and
> strace as those were fixed for a similar issue but through version
> bumps on master.  Is there some backstory (beyond the patchwork
> submissions for master) on other attempts to bring glibc 2.31 support
> to LTS?
>

Wondering about your thoughts on adding GLIBC 2.3.1 support to the
2020.02 LTS.  Technically, we believe that the patches that need
cherry picked over from master are the following.  What do you guys
think?  Should we pull out the individual commits within those
projects(more patches in Buildroot) or are these (strace/openssh)
bumps OK?

      859264312b package/openssh: bump to version 8.2p1
      64fbba5778 package/busybox: fix build with musl 1.2.0
      269d426710 package/busybox: fix build with glibc 2.31
      5de06a91cf package/strace: bump to version 5.5

Best Regards,
Matt
