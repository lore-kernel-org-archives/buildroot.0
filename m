From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Sat, 9 Mar 2013 12:02:05 -0300
Subject: [Buildroot] Regarding /dev management
In-Reply-To: <87ppz83brq.fsf@dell.be.48ers.dk>
References: <CALF0-+WdzsqUdQyiwagDELkqx5HhdxEe+_LwKpwgs-LVosLd0g@mail.gmail.com>
 <87ppz83brq.fsf@dell.be.48ers.dk>
Message-ID: <CALF0-+VFD6Jg=sJycngDifUoD5UcbmWgJpVRoL7iZXE7rtkN4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for your reply.

On Sat, Mar 9, 2013 at 11:09 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
>  E> However, being new to buildroot, perhaps I'm speaking non-sense and the
>  E> developer is expected to use its own custom skeleton in this case.
>
> We already take care of this for initramfs, see fs/cpio/init and the
> ROOTFS_CPIO_ADD_INIT rule. Doesn't that work for you?
>

Ah, I see. Yes that works for me. I was using "rdinit=/linuxrc" in my
kernel parameters. Removing that, and now it works fine! Thanks a lot!

Another question:
Isn't any configuration option to add a debugfs mount to fstab?

-- 
    Ezequiel
