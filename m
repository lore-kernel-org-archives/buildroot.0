From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2013 21:12:03 +0100
Subject: [Buildroot] What is an Acked-by?
In-Reply-To: <52A0C223.5040306@mind.be>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386198891-17968-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131204231952.GI3332@free.fr> <52A0C223.5040306@mind.be>
Message-ID: <20131205201203.GF3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-05 19:12 +0100, Arnout Vandecappelle spake thusly:
> On 05/12/13 00:19, Yann E. MORIN wrote:
> >Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  If you've reviewed it and tested it, you would commit it if you had commit
> access, right? So this could actually be an Acked-by, right? Or is my
> understanding of these tags incorrect?

I'm following the definitions of Documentation/SubmittingPatches in my
Linux kernel tree.

For example, I refer to:
    Acked-by: does not necessarily indicate acknowledgement of the entire
    patch.

    Reviewed-by:, instead, indicates that the patch has been reviewed
    and found acceptable according to the Reviewer's Statement
    [--SNIP statement--]

So, by providing both Reviewed-by and Tested by, I am explicitly stating
that I did a review of the patch, and I tested it. Which, from my
understanding, Acked-by does.

Also, I do not believe to be in a position to provide my Acked-by on the
core infrastructure, which is rather Thomas' domain. So, Thomas would be
right to provide his Acked-by on such patches (but obviously he can't on
those, since he's the author).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
