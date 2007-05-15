From: Ajay Sharma <linuxnajay@gmail.com>
Date: Tue, 15 May 2007 13:16:47 -0700
Subject: [Buildroot] buildroot Digest, Vol 11, Issue 19
In-Reply-To: <mailman.1.1179255601.12844.buildroot@uclibc.org>
References: <mailman.1.1179255601.12844.buildroot@uclibc.org>
Message-ID: <1b0abb4c0705151316j760a48co480ce75984aadbfa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brian,

As you can read above in my previous message. I too had the same problem.
Good to know that this will happen for other busy box versions too. I didnot
try them.
Also I tried Mats solution but that was of no help. you may want to see my
post and its reply.
Has it got to do with the Kernel Headers ? Can we edit and use a different
kernel version? or a different version of uclibc will help ?
Let me try with a different version of uclibc as  i know how to try that...

Thanks
-Ajay

Message: 5
> Date: Tue, 15 May 2007 06:15:41 -0500
> From: Brian Austin <brian.austin@cirrus.com>
> Subject: [Buildroot] EABI toolchains do not free init in busybox
> To: buildroot at uclibc.org
> Message-ID: <1179227741.17486.52.camel@localhost.localdomain>
> Content-Type: text/plain
>
> Hello,
>
> I have been building gcc-4.1.1, 4.1.2, 4.2 toolchains for ARM9 EABI with
> 2.6.20.4 kernel headers from buildroot. I am using daily snapshots of
> uClibc as well.
>
> I have tried busybox 1.2.0, 1.4.1, and 1.5.0,  same results.
>
> the files are built in EABI format as well
>
> they build fine and compile all lf my code and generate a ramdisk.
>
> kernel boots, but init does not let go and bring me to a shell.
>
> Has anyone had any success with building EABI toolchains for ARM9 from
> buildroot?
>
> I can post my uclibc and buildroot configs if needed.
>
> Thanks,
>
> Brian
>
>
>
>
> ------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> End of buildroot Digest, Vol 11, Issue 19
> *****************************************
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070515/714f1cbf/attachment.htm 
