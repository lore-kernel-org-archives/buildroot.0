From: Jeff Tchang <jeff.tchang@gmail.com>
Date: Fri, 28 Aug 2020 13:41:16 -0700
Subject: [Buildroot] Unable to bake in an initramfs filesystem into
 kernel image
In-Reply-To: <87sgc6ld4d.fsf@dell.be.48ers.dk>
References: <CAG+zT3rM=eaW6oykBgiVdPd4fnZF=efbgBok6Q8WCy2QQ2EnDw@mail.gmail.com>
 <313ae7e3-1817-e633-acc3-6d7097f99ffc@mind.be>
 <87sgc6ld4d.fsf@dell.be.48ers.dk>
Message-ID: <CAG+zT3p7mpU9rs-mGZwuXC4t-agx0RoSboX2AE-kbvksvxnR6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> FYI, I've just tested the initramfs support on current master (on an ARM
> platform) and it works as expected.
>
>
Thank you. I managed to resolve this. The issue was that the cpio file did
not properly have /init in it.
I double checked and extracted the file to make sure everything was where
it was supposed to be and it wasn't.

Fixed that and everything worked like a charm.

-Jeff
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200828/9ca5b063/attachment.html>
