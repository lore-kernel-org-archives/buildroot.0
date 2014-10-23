From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 23 Oct 2014 10:57:46 +0200
Subject: [Buildroot] error with package "stress"
In-Reply-To: <CABzetm1vUcQicNyMwtEnee++2k4C4SRgxjV2twS+VG5yFj_k4g@mail.gmail.com>
References: <CABzetm1vUcQicNyMwtEnee++2k4C4SRgxjV2twS+VG5yFj_k4g@mail.gmail.com>
Message-ID: <CAGduivwt7e0NFLi=f9Rfo54qh4rROi7CgoWEE4vPC4jKY=sG_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rohit,

On Thu, Oct 23, 2014 at 7:18 AM, Rohit Kumar <rkthebest@gmail.com> wrote:
> Hello,
>
> i am trying to install "stress" under Buildroot 2014.08-git-01176-ge3d3a49
> with the attached configuration file, but i am getting following error.
>
>>>> linux  Downloading
> Doing shallow clone
> fatal: repository 'linux-' does not exist
> Shallow clone failed, falling back to doing a full clone
> Doing full clone
> fatal: repository 'linux-' does not exist
> --2014-10-23 14:13:37--  http://sources.buildroot.net/linux-.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net
> (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-10-23 14:13:38 ERROR 404: Not Found.
>
It's perfectly normal, you specified that you wanted to build a kernel
from a custom tree, but you never specified nor the url to find the
said tree, nor the version you wanted to build.
You can define then in the 'Kernel' menu when you do a 'make menuconfig'
>
> With Regards,
>
> Rohit Kumar
> +82 1073149173
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
