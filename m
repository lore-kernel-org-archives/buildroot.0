From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 2 Jan 2008 11:54:55 -0700
Subject: [Buildroot] Filesystem problem
In-Reply-To: <002e01c84d4c$11ff0cc0$35fd2640$@com>
References: <002e01c84d4c$11ff0cc0$35fd2640$@com>
Message-ID: <fa686aa40801021054y64b480d0ldbb80ef2c98e5afa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/2/08, mojtaba <kernelppc@gmail.com> wrote:
> Dear all,
>
> I am trying to boot a root file system build by buildroot. But I got this
> error" init has generated signal 11 but has no handler for it".
>
> My kernel version is 2.6.24-rc3
> My target system is PPC 405 (XILINX VIRTEX II pro)
> I am using the 26-12 snapshot of buildroot
>
<snip>
>
> mice: PS/2 mouse device common for all mice
> VFS: Mounted root (ext2 filesystem) readonly.
> Freeing unused kernel memory: 76k init
> Warning: unable to open an initial console.
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
You probably don't have /dev/console in your root filesystem.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
grant.likely at secretlab.ca
(403) 399-0195
