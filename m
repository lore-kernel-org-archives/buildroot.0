From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2011 23:14:09 -0700
Subject: [Buildroot] Cannot compile gcc in target
In-Reply-To: <AANLkTin2wP04wwz-YyYeAPkjT=xzua=+LpmekAsP2zFN@mail.gmail.com>
References: <AANLkTi=0qnn024KC8WWhg33-wCWi2Loy1RrBVuL0HdOT@mail.gmail.com>
	<AANLkTin2wP04wwz-YyYeAPkjT=xzua=+LpmekAsP2zFN@mail.gmail.com>
Message-ID: <AANLkTikNn9R+BF4yrwJhu2wRD_HaU2bRaR7iZ3rkLUe8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 17, 2011 at 9:33 PM, Barry Kauler <bkauler@gmail.com> wrote:
> Update, I have now got gcc-target to compile.
>
> I don't know what I did specifically, but I reran menuconfig and made
> a few changes: changed gcc from 4.3.5 to 4.4.5, changed old
> linuxthreads to posix native threads, enabled mpc package, maybe one
> or two other things.
>
> I read somewhere that gcc needs mpc, but really unsure about that.

mpc is only needed for gcc 4.5 and newer. You should not require that for
gcc 4.3.5 or 4.4.5
