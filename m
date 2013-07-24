From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Jul 2013 12:47:33 -0300
Subject: [Buildroot] [PATCH] package/uclibc: fix big oops from fb354d5f
In-Reply-To: <CAG2jQ8hXiNw2sJmJW6Hu79gya=2ez+4pFA=y86FXtYpDaXOr6w@mail.gmail.com>
References: <1374678159-13377-1-git-send-email-gustavo@zacarias.com.ar>
 <CAG2jQ8hXiNw2sJmJW6Hu79gya=2ez+4pFA=y86FXtYpDaXOr6w@mail.gmail.com>
Message-ID: <51EFF715.4090900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/2013 12:22 PM, Markos Chandras wrote:

> The patch is partially ok. It breaks mips64 that was fixed in
> 
> http://git.buildroot.net/buildroot/commit/package/uclibc/0.9.33.2?id=fb354d5faaa9b912e3d868b92622c11323d6ae9f
> 
> I've also commented on that in the uClibc list

Right, sent V2 to both lists.
Careful with whitespace and constructs in makefiles next time ;)
Regards.
