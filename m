From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 4 Sep 2012 14:28:17 -0500
Subject: [Buildroot] fs skeleton quick rebuild
In-Reply-To: <504648B4.6010301@relinux.de>
References: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
 <504648B4.6010301@relinux.de>
Message-ID: <CAE9DZUTeYv-JLiQ3Fyny0Cx1_KWZrKrmW6wjGGYKisuvYEoVtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That helps tons.  Thanks guys!

On Tue, Sep 4, 2012 at 1:30 PM, Stephan Hoffmann <sho@relinux.de> wrote:
> Am 04.09.2012 19:59, schrieb Dallas Clement:
>> Greetings:
>>
>> I'm working on a custom skeleton for my rootfs and wanting to make
>> changes and test without having to rebuild everything.  Is there an
>> easy way to do this?
> Hi,
>
> I figured out that
> 1. remove output/target
> 2. remove output/build/.root
> 3. remove all .stamp_target_installed files
> give a quite fast, clean rebuild of the root file system.
>
> Hope that helps
>
> Stephan
>> Thanks,
>>
>> Dallas
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
> reLinux     -    Stephan Hoffmann
> Am Schmidtgrund 124    50765 K?ln
> Tel. +49.221.95595-19    Fax: -64
> www.reLinux.de     sho at reLinux.de
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
