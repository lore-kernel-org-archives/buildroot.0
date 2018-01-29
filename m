From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:13:53 +0100
Subject: [Buildroot] [PATCH 12/14] size-stats-compare: fix code style
In-Reply-To: <1516581882-30582-13-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1516581882-30582-13-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180129231353.64fa64c8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Jan 2018 22:44:40 -0200, Ricardo Martincoski wrote:
> Fix these warnings:
> E129 visually indented line with same indent as next logical line

Really?

>      header = next(reader)
>      if (header[0] != 'File name' or header[1] != 'Package name' or
> -        header[2] != 'File size' or header[3] != 'Package size'):
> +            header[2] != 'File size' or header[3] != 'Package size'):

This looks totally bogus to me. The code was properly and nicely
indented before the change, and now it looks badly indented. Is this
really what flake8 wants? If so, flake8 is very strange.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
