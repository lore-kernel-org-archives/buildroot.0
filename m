From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 9 Aug 2011 22:39:19 -0300
Subject: [Buildroot] Out of tree kernel sources?
In-Reply-To: <4E419F65.8060604@netscape.net>
References: <4E419F65.8060604@netscape.net>
Message-ID: <CAExDhvZHSpLzM42vHAxoZkGpP44StxmS2aOitHAyzERWiO5fAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulrich,

     If I'm not mistaken, you are looking for O=/some/folder argument.
     I've only tried it once, so forgive me if I'm not remembering it
correctly. I'm almost sure make help will tell you. Could try it to be
sure if I wasn't on the road with such a slow notebook :(

Kind Regards,
     Thiago A. Correa

On Tue, Aug 9, 2011 at 5:58 PM, Ulrich Prinz <uprinz2@netscape.net> wrote:
> Hello to the list!
>
> Im the new guy here, restarting into buildroot again after a few years
> pause.
>
> Congrats for the big improvements that where done. Started a simple
> trial for a AT91SAM9 device and it worked out of the box. Great!
>
> But I have a question for out of tree source code for the kernel.
>
> I know that you can call the kernels make by passing SRC1DIR= and
> SRC2DIR= arguments to prefer these source code directories above the
> kernels own ones. This is very comfortable as you can simply copy the to
> be modified kernel code there and do whatever you want. So all your
> changes collect there and you do not have to search for what you did
> yesterday. And you don't have to have a clean kernel copy for diff or to
> mess with gis/svn/cvs.
>
> But I cannot find any hint if this is an option in buildroot. Have I
> missed it?
>
> Thanks in advance and best regards
> Ulrich
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
