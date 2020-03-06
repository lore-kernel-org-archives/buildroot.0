From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 6 Mar 2020 09:00:12 -0600
Subject: [Buildroot] update --march= for x86_64
In-Reply-To: <ea-mime-5e626162-549c-4ada36db@www-1.netcourrier.com>
References: <ea-mime-5e626162-549c-4ada36db@www-1.netcourrier.com>
Message-ID: <7b092051-65b0-bbe8-d334-1994dff06158@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis-Paul,

On 3/6/20 8:42 AM, lpdev at cordier.org wrote:
> Hi all,
>
> GCC has evolved a lot since 4.x versions. It seems that some target architectures are not available anymore (like corei7 and corei7-avx). GCC has moved to processor family names (like sandybridge, ivybridge) for the --march= parameter.
>
> These new nqmes can be checked here:
>
> - For old gcc: https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options
> - For gcc 7: https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gcc/x86-Options.html#x86-Options
>
> I can send a serie of patches for moving (or adding) from old march to new march syntax, by adding some of the most used intel processors that are used for embedded systems (low power cores i3/i5/i7-U, some atom x series and intel mXXX series).
Considering BR still supports GCC 4.8, this would have to be conditional 
on the selected GCC version.
> Before working on this, I would like to have an advice from a toolchain guru if possible.
>
> Thanks!
>
> Louis-Paul CORDIER
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
