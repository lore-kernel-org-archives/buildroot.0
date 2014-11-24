From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 24 Nov 2014 23:25:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/nginx: fix build failure
In-Reply-To: <20141123183808.5306c947@free-electrons.com>
References: <1416763150-28951-1-git-send-email-s.martin49@gmail.com>
 <1416763150-28951-2-git-send-email-s.martin49@gmail.com>
 <20141123183808.5306c947@free-electrons.com>
Message-ID: <CAHXCMMKA3o8wcG3htW8F4Ndvo5L0_aQHZo9dEpzjf8WUawcXWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 23, 2014 at 6:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 23 Nov 2014 18:19:10 +0100, Samuel Martin wrote:
>> sysctl syscall may not be enabled in the kernel config, so do a build-test
>> to enable/disable sysctl function call.
>
> It's not a kernel configuration problem. sysctl() is a deprecated
> system call, so all new architectures (such as ARC) don't implement it.

Do you want me to update the commit log?
Or shall I make the rtsig support depends on !BR2_arc?

Regards,

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Samuel
