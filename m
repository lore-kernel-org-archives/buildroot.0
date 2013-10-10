From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 19:29:40 +0200
Subject: [Buildroot] make-4.0
In-Reply-To: <87pprdwft4.fsf@dell.be.48ers.dk>
References: <CAB0FRstfgMy3c2t1uUfdkusX8XzwF85CXodwyzVtZ4w6aN-QtQ@mail.gmail.com>
 <87pprdwft4.fsf@dell.be.48ers.dk>
Message-ID: <20131010172939.GC3230@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-10-10 13:01 +0200, Peter Korsgaard spake thusly:
> >>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:
>  Fran?ois> GNU make 4.0 has been released (see
>  Fran?ois> http://savannah.gnu.org/forum/forum.php?forum_id=7749).
>  Fran?ois> This version introduces only 1 backward-incompatibility (instead of 7
>  Fran?ois> with version 3.82).
>  Fran?ois> See below, an extracted part of the file NEWS.
> 
>  Fran?ois>   WARNING: Backward-incompatibility!
> 
>  Fran?ois>   Variables ending in "!" previously defined as "variable!=
>  Fran?ois>   value" will now be interpreted as shell assignment.  Change
>  Fran?ois>   your assignment to add whitespace between the "!" and "=":
>  Fran?ois>   "variable! = value"
> 
> We luckily don't have any of those:
> 
> git grep '[^ ]!=' **/*.mk

Well, whoever was mental enough to use '!' in variable names deserves
the breakage anyway! :-)

But hopefully, make-4.0 won't be such a pain make-3.82 was. What flew in
the GNU folks to release a highly backward-incompatible version as a
minor release? Seriously? Even if it fixed undocumented limitations, it
really broke more than a handfull of projects, of which high-profile
projects like the Linux kernel or the glibc. And I don't count the
others. Oh well... Sigh... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
