From: Christian Stewart <christian@paral.in>
Date: Sun, 16 Aug 2020 12:59:02 -0700
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
Message-ID: <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Fri, Aug 14, 2020 at 6:23 AM Michael Fischer <mf@go-sys.de> wrote:
>
> Hi
>   Michael
>
> it seems to be a glibc bug.
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=965932
>
> https://salsa.debian.org/glibc-team/glibc/-/commit/b1488bfda31968a724afa3ba212001a807603efd

FWIW I actually had the same, was trying to test an odroid XU4 and the
SSH server was immediately closing the connection. I double-checked
that openssh was at the latest version & I was on the latest buildroot
master as well, and assumed at the time it must have had something to
do with the kernel bump I was testing.

Now I'm thinking maybe this was causing it. Will test again later today.

Best,
Christian
