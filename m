From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jan 2017 09:29:18 +0100
Subject: [Buildroot] Kernel and u-boot tarballs with same name
In-Reply-To: <4b4b1204-d0c2-b62f-275d-4fd5220b6cc3@cartelsol.com>
References: <4b4b1204-d0c2-b62f-275d-4fd5220b6cc3@cartelsol.com>
Message-ID: <20170107082918.GA3378@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On 2017-01-07 04:03 +0100, Marcus Hoffmann spake thusly:
> I just stumbled about a weird build failure.
> I am using Xilinx' linux kernel and u-boot from their github:
> https://github.com/Xilinx/linux-xlnx and
> https://github.com/Xilinx/u-boot-xlnx
> 
> They provide release tarballs both named like this:
> xilinx-v2016.4.tar.gz. Exactly the same for the kernel and u-boot.
> Buildroot now tries build the extracted kernel as u-boot which gave me a
> very confusing failure during configure.
> 
> What would be the recommended approach here? I guess there is no way to
> provide a 'save as' name for a tarball?
> For now I changed back to checking out the git repo.

That's the only option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
