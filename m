From: hardik gohil <hardikmjobs@gmail.com>
Date: Thu, 5 Feb 2015 15:03:47 +0800
Subject: [Buildroot] Fwd: Problem with rcK script
In-Reply-To: <01A97699-6B5B-436F-907D-F9A1C8F05285@gmail.com>
References: <CAJpGAeFjiFn9rw3uj9j1xbA4JqWr4PJ89X9A_7=VKjKYK6Yu8Q@mail.gmail.com>
 <CAJpGAeHWB=+AU9-ZCSpczqsy_06H2x8mp-b7=dvHSsiHZQU7sQ@mail.gmail.com>
 <01A97699-6B5B-436F-907D-F9A1C8F05285@gmail.com>
Message-ID: <CAJpGAeEqvTi1EkbGLy-p4PnFwZWR7gZWKmij+fn-sHB8ZvHLpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for your exact solution.

I am not using any swap memory,is it fine to remove "swapoff -a" from
inittab ?

I think it will be fine.

On Wed, Feb 4, 2015 at 11:57 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi,
>
> On February 4, 2015 9:33:10 AM CET, hardik gohil <hardikmjobs@gmail.com>
> wrote:
> >Hello,
> >
> >I am working on Embedded Board and using buildroot-2013.02 and
> >linux-2.6.35.9
> >
> >problem i am facing is with rcK script which runs once system is
> >rebooted
> >as mentioned in /etc/inittab.
> >
> >As mentioned in rcK script to stop all the init scripts in /etc/init.d
> >in
> >reverse order i cannot see any such messages.
>
> The problem you describe has been fixed in later releases, with commit
>
> http://git.buildroot.net/buildroot/commit/system/skeleton/etc/inittab?id=1dbb7e8a822416d502095ecb2c463a5179074555
> .
>
> I suggest you either upgrade buildroot or apply this patch in your tree.
>
> Best regards,
> Thomas
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150205/2feb1219/attachment.html>
