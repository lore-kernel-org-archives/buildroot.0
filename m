From: Vasanth Ragavendran <ragavendra.2007@gmail.com>
Date: Mon, 5 Nov 2012 20:46:02 +0800
Subject: [Buildroot] Build root local site method
In-Reply-To: <CADfuMF4YnAPm_m6YbjO0oCYPJKxqgGwX9amz7SOXhRB3x3mewg@mail.gmail.com>
References: <CADfuMF4YnAPm_m6YbjO0oCYPJKxqgGwX9amz7SOXhRB3x3mewg@mail.gmail.com>
Message-ID: <CADfuMF6mirEsNgu7gcJeqygFYVuoRME67JMbWkJu_6vNN-Q5HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And forgot to mention I'm using the latest buildroot version 2012.08. So it
should work but I'm not sure if I'm missing something. Plz help.


On Mon, Nov 5, 2012 at 8:41 PM, Vasanth Ragavendran <
ragavendra.2007@gmail.com> wrote:

> Hi
>
> This is with reference to the download method which is specified while
> compiling a new package. I'm writing certain programs which needs to be
> cross compiled and run in my embedded board. In my <pkg>.mk file I'm
> specifying the 'site' to the directory containing my source code and the
> 'site_method' to "local". I've made necessary changes to the Config.in
> files in all locations. I am able to select this package of mine from the
> menuconfig, however the package refuses to build for some unknown reason
> neither does the build print any errors. It just quietly skips compiling
> this package and finishes generating the file system. And the location
> which I'm pointing to in the mk file contains the necessary source code.
> I'm wondering what step I've skipped. Attaching the Config.in and <pkg>.mk
> file which I've created for my package. Kindly help as I'm struck in this
> and unable to proceed. I've referred to the manual but unable to solve this
> issue.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/03879e3f/attachment.html>
