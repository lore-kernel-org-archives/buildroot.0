From: Ed Sutter <ed.sutter@alcatel-lucent.com>
Date: Thu, 09 Jan 2014 15:11:51 -0500
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <CAOkaJuVGa4_Et8TL80MEsh8sN1mseKvQ4OZ9RzxSouytbZFUFQ@mail.gmail.com>
References: <52CC7292.306@alcatel-lucent.com>	<CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>	<52CD5340.2090200@alcatel-lucent.com>
 <CAOkaJuVGa4_Et8TL80MEsh8sN1mseKvQ4OZ9RzxSouytbZFUFQ@mail.gmail.com>
Message-ID: <52CF0287.8010505@alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Ed,
>
> On Wed, Jan 8, 2014 at 5:31 AM, Ed Sutter 
> <ed.sutter at alcatel-lucent.com <mailto:ed.sutter@alcatel-lucent.com>> 
> wrote:
>
>     The iMX6 is a Cortex A9; however, looking at my notes, I see that
>     the instructions
>     I got this from say to use Cortex A8.  When I make that one
>     change, this problem goes away...
>     How is it that changing from A9 (valid for iMX6) to A8 would
>     affect command line regular
>     expression parsing?
>     Ed
>
>
> I wish I had an explanation for you, but I don't. Perhaps someone else 
> on the list can shed some light onto what is happening here.
>
> -Peter
Thanks, the strange thing in my case is the iMX6 is cortex-A9, but I had 
to step back to
cortex-A8 in menuconfig for this to work.
I did notice that when I use A9 vs A8, the floating point settings 
automatically change
in menuconfig.  I *thought* A8 & A9 were the same from that standpoint, 
but not really
sure.  Anyway, I plan to spend at least the next few days looking into 
this, so hopefully I'll
have more information soon.

Ed
