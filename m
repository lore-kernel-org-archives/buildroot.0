From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 18 Nov 2011 13:47:03 +0100
Subject: [Buildroot] add cpulimit buildroot
In-Reply-To: <CALoDM-H_TdS37EzBhWT3qyh3rxuf66X=5q6x957__USQVgkpvA@mail.gmail.com>
References: <CALoDM-H_TdS37EzBhWT3qyh3rxuf66X=5q6x957__USQVgkpvA@mail.gmail.com>
Message-ID: <CAAXf6LXTUj-rYdWh+X8Mo3nnoY=DwYsprza+G04swXfbDOPyhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vignesh,

On Fri, Nov 18, 2011 at 1:07 PM, vignesh rajendran
<vickylinuxer@gmail.com> wrote:
>
>
> Hi list.,
>
> ?cpulimit is a simple c source? package , that can easily added to
> buildroot.Please take a look at,
>
> http://cpulimit.sourceforge.net/

Maybe it's a good idea that you try adding it yourself and then submit
a patch to the list?
There is a good explanation about adding packages here:
http://buildroot.org/downloads/buildroot.html#add_packages

I think you need the GENTARGETS infrastructure.

In case of problems, you can of course ask on the list.

Best regards,
Thomas
