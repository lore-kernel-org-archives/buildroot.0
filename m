From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 11:14:05 +0200
Subject: [Buildroot] Trouble building the manual
In-Reply-To: <10469D7B3F0C4FA0BDDC951C132C8F83@JohanW7>
References: <10469D7B3F0C4FA0BDDC951C132C8F83@JohanW7>
Message-ID: <20131009111405.0ca6bcf3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 9 Oct 2013 11:04:16 +0200, Sagaert Johan wrote:

> # make manual-pdf
> >>>   Updating the manual lists...
> Traceback (most recent call last):
>   File "/home/buildroot12git/support/scripts/gen-manual-lists.py", line 41, in <module>
>     from argparse import ArgumentParser
> ImportError: No module named argparse
> make: *** [manual-update-lists] Error 1

You need the Python argparse module. In recent versions of Python, it's
part of the standard library. With older versions, you need to install
separately.

Check if your distribution has a package called python-argparse or
something like that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
