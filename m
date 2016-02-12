From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Feb 2016 07:39:45 -0300
Subject: [Buildroot] [PATCH 1/3] gssdp: bump to version 0.14.14
In-Reply-To: <56BD52E5.5090804@imgtec.com>
References: <1455123877-9983-1-git-send-email-gustavo@zacarias.com.ar>
 <56BD52E5.5090804@imgtec.com>
Message-ID: <56BDB671.60001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/16 00:35, Rahul Bedarkar wrote:

> But project web page https://developer.gnome.org/gssdp/ says 0.14.14 is
> a development version. And same applies for gupnp and gupnp-av.
>
> Regards,
> Rahul

Hi Rahul.
Gnome project pages are generally not so great to say the least.
The general rule is odd = devel, even = stable, see:
https://www.gnome.org/gnome-3/source/
And in general for devel versions there are no .z (w.x.y.z) versions, 
whereas gssdsp has one:
http://ftp.acc.umu.se/pub/gnome/sources/gssdp/0.14/gssdp-0.14.12.1.news
Which sounds pretty much like a stable fix :)
If you look at the news files, it's all fixes, essentially no API changes.
And looking at what distributions use they're all on 0.14.x for stable 
as well.
Regards.
