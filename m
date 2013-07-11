From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 11:06:37 -0300
Subject: [Buildroot] [PATCH] gcc: provide an option to enable mudflap
 support
In-Reply-To: <1373550693-14815-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373550693-14815-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51DEBBED.3010709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2013 10:51 AM, Thomas Petazzoni wrote:

> The mudflap library is only useful if one uses the -fmudflap gcc
> option, to do more checks on pointers/arrays, which is typically not
> the case. Until now, it was always being built. This commit disables
> it by default to save a little bit of build time, and provides an
> option to enable it when needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Nobody used it i think because libmudfap*.so* isn't copied to the target
and it won't work without it.
V2 incoming? ;)
Regards.
