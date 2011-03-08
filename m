From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2011 10:31:59 +0100
Subject: [Buildroot] Python: can't resolve symbol
In-Reply-To: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
References: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
Message-ID: <20110308103159.2ca3d89b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Mar 2011 08:20:39 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> >From what I can tell, these "can't resolve" messages are caused when
> selecting "readline"
> 
> 
> # python
> Python 2.7.1 (r271:86832, Mar  7 2011, 22:37:34)
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
> >>>

It works just fine here, so I presume there is some information leaking
from your host. Could you post somewhere (not on the list, as it
would be too big) :

 * Your Buildroot .config
 * The complete Buildroot build log
 * The build/python-2.7.1/config.log file in your output directory.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
