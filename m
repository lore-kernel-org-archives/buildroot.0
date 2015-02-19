From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 19 Feb 2015 01:41:15 +0100
Subject: [Buildroot] [PATCH 2/3] package/openvmtools: fix syncDriverPosix
In-Reply-To: <CABbD_XDZueJ8TmNmdD=V2Wd9XDE2S=gUJwfbkd5o=-kA+Kcmkw@mail.gmail.com>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>	<1423437730-22997-2-git-send-email-romain.naour@openwide.fr>	<20150214092058.1269ba68@free-electrons.com>	<54DF33BA.3090008@openwide.fr>
 <CABbD_XDZueJ8TmNmdD=V2Wd9XDE2S=gUJwfbkd5o=-kA+Kcmkw@mail.gmail.com>
Message-ID: <54E5312B.1000706@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly, Thomas, all,

Le 15/02/2015 21:55, K?roly Kasza a ?crit :
> Hi Romain, Thomas, list,
> 
> 
>     > Note that Debian also has a collection of patches on open-vm-tools, and
>     > at least two of them seem to fix security related issues. Is this stuff
>     > still maintained upstream? They have apparently moved their development
>     > to github, at https://github.com/vmware/open-vm-tools.
> 
>     Indeed, I've cloned this repository to check if the Fedora patches were merged.
>     It seems that it is still maintained, but not on regular basis.
> 
>     I think the two patches from Debian needs further testing...
>     Karoly can you review those patches ?
> 
> 
> Of course, I'll add those to my (sadly ever growing) to-do list. Hopefully I can
> do it sometime this week.
> I promised a new Inetutils revision too to Thomas, but it is only half done yet.

Great :)

On my side, I completed the open-vm-tools package to be able to build and
install the open-vm-tools's kernel module. I have successfully tested the
vmhgfs.ko module by sharing a folder between the host and the guest.

I'm using a 3.2 kernel but the build is broken for recent kernel (I tried with a
3.14 kernel)

I applied most of the patches from debian, fedora and archlinux but I need
further testing.

Best regards,
Romain

> Kind regards
> Karoly
> 
>  
