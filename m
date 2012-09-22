From: Paolo Virgili <p.virgili67@gmail.com>
Date: Sat, 22 Sep 2012 18:38:03 +0200
Subject: [Buildroot] Fwd: Re: Buildroot configuration usage
In-Reply-To: <505DCACF.7060104@gmail.com>
References: <505DCACF.7060104@gmail.com>
Message-ID: <505DE96B.8080307@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Peter,

thanks for you answer. My buildroot revision is:
Buildroot 2012.11-git-00140-ge1aee06 Configuration
Is working right on my office PC in the same condition (VMWare
8.0.4/ubuntu 12 04 1 etc..)
In followed your work around, load .config provided me and load it with
make menufile.
Configuration seem ok. Now I'm executing make command...
If you want we can try to debug this trouble on my PC just to patch this
behaviours, but I need
more help because I'm a new on Linux environement (I'm a senior
developer on Microsoft
platform, MFC specialyzed).

How many time is needed to make command to complete it's job?
Thanks
  Paolo

Il 22/09/2012 15:28, Peter Korsgaard ha scritto:
>>>>>>  "p" == p virgili67<p.virgili67@gmail.com>   writes:
>    p>   Dear Peter,
>
>  Hi,
>
>  Please send Buildroot questions to the buildroot list
>  (buildroot at uclibc.org) instead of directly to me in the future, thanks.
>
>    p>   I need to signal you a strange behaviours of buildroot: if I select
>    p>   Load an Alternate Configuration File and press<ENTER>   nothing
>    p>   happen.  I try to select other sub menu, but when I press<ENTER>,
>    p>   nothing happen. All other key are working right, ENTER don't work
>    p>   (only in this context).  Have you some suggestion for me.  I need to
>    p>   load an Aaternate configuration file from an hardware
>    p>   provider. there is anoter way to load this file in my build root
>    p>   packet.  Some other information: LINUX distribution is last ubuntu
>    p>   downloaded by ubuntu web page, installe in a virtual machine inside
>    p>   VMWare 8.0.4.
>
>  What Buildroot version are you using? It seems to work ok here with
>  latest git.
>
>  As a workaround you could always copy your alternative configuration to
>  .config in the buildroot dir before running make menuconfig.
>
>
