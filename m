From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Tue, 21 Sep 2010 08:41:40 -0400
Subject: [Buildroot] new to the list
In-Reply-To: <4C9876A0.7070908@viva-vous.net>
References: <4C9876A0.7070908@viva-vous.net>
Message-ID: <AANLkTiknjXr-8JAAMJPGfLQ2-PsakMyo5gHD4QFUNpB2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bonjour Herv?,

Wild guess here; but would it be possible that your home directory
is mounted with the noexec flag? (check the output of the mount command)

Pierre-Luc

On Tue, Sep 21, 2010 at 5:10 AM, herve <herve@viva-vous.net> wrote:

> Hello
>
> I am new to the list and i'll try to use buildroot with the eken m001 mid
> with a VIA MW8505 600MHz cpu, it comes with android 1.6 and linux kernel
> 2.6.29. I fouind on the web a "debian rom" working so linux is possible on
> it, everythong working.
>
> I download the tarball, extract it and run make menuconfig. the compilation
> process stop somewere with :
>
> rm /home/herve/plus/buildroot/output/build/buildroot-config/zconf.tab.c
> make[1]: quittant le r?pertoire ? /home/herve/plus/buildroot/package/config
> ?
> /bin/bash: /home/herve/plus/buildroot/output/build/buildroot-config/mconf:
> Permission non accord?e
>
>
>
> the same with 2010.08 and the latest snapshot, root or regular user.
>
> i am on debian squeeze/sid what can i do, or read, in order to achieve this
> ?
>
> thanks
>
> herv?
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100921/7c4d988b/attachment.html>
