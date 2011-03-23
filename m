From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 23 Mar 2011 19:39:41 -0400
Subject: [Buildroot] Python: can't resolve symbol
In-Reply-To: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
References: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
Message-ID: <AANLkTikg36zVWyJdX6UJQcn1CUfbNgaZYCgk-8kWrMN5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 8, 2011 at 3:20 AM, bruce bushby wrote:
> # python
> Python 2.7.1 (r271:86832, Mar ?7 2011, 22:37:34)
> [GCC 4.5.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> python: symbol 'BC': can't resolve symbol
> python: symbol 'PC': can't resolve symbol
> python: symbol 'UP': can't resolve symbol
> python: symbol 'tgetnum': can't resolve symbol
> python: symbol 'tgoto': can't resolve symbol
> python: symbol 'tgetflag': can't resolve symbol
> python: symbol 'tputs': can't resolve symbol
> python: symbol 'tgetent': can't resolve symbol
> python: symbol 'tgetstr': can't resolve symbol

bug in buildroot.  i'll send a patch.
-mike
