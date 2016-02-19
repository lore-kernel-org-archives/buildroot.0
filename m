From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Feb 2016 12:44:18 -0300
Subject: [Buildroot] [PATCH 2/2] glibc: bump default to version 2.22
In-Reply-To: <87y4aghfxm.fsf@dell.be.48ers.dk>
References: <1455888754-10726-1-git-send-email-gustavo@zacarias.com.ar>
 <1455888754-10726-2-git-send-email-gustavo@zacarias.com.ar>
 <87y4aghfxm.fsf@dell.be.48ers.dk>
Message-ID: <56C73852.8000400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/16 12:34, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Committed to next, thanks.

Hi.
Big general question for everyone, we now have 3 versions of glibc (not 
counting eglibc).
The only reason for keeping 2.21 is sparc (< v9) support, which i think 
doesn't make sense.
The case for eglibc is somewhat similar, it's support for SPE FPU (e500*).
Both are covered by uclibc so i think we could retire them.
Regards.
