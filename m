From: Bryan Hundven <bryanhundven@gmail.com>
Date: Thu, 30 Dec 2010 14:39:59 -0800
Subject: [Buildroot] commiting patches
In-Reply-To: <87aajmhp1i.fsf@macbook.be.48ers.dk>
References: <20101230063005.15755osot9w5qwco@www.home.zuerker.org>
	<8739pfhtgk.fsf@macbook.be.48ers.dk>
	<AANLkTingc4f9wGxik=8Y+FuAzZaeH240ouExDr+sgVHb@mail.gmail.com>
	<87ipyahq2q.fsf@macbook.be.48ers.dk>
	<20101230162413.13955er2j6eqzl0k@www.home.zuerker.org>
	<87aajmhp1i.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimOcBs0JfVOwUin6z+o4JhGbDv79z9RPQ5pcfeN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 30, 2010 at 2:30 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>
> Hi,
>
> ?>> I prefer an Acked-by: tag like it's done for the Linux kernel and a
> ?>> bunch of other projects using git (and like Thomas already does).
>
> ?Heiko> This may be a stupid question: you want the Acked-by in the patch file
> ?Heiko> itself, right?
> ?Heiko> Is there an easy way to do this if there are multiple patches?
>
> Well, by nature of a review you have to look at each mail, so just hit
> reply and add your acked-by (or script your editor).

No editor/plugin war intended.

I use snipMate: http://www.vim.org/scripts/script.php?script_id=2540

a vim plugin. I add the following to ~/.vim/snippets/_.snippets

-------------8<-----------------8<------------------
snippet ack
    Acked-by: ${1}
snippet rev
    Reviewed-by: ${1}
snippet sob
    Signed-off-by: ${1}
snippet tested
    Tested-by: ${1}
snippet me
    Bryan Hundven <my@email.address>
-------------8<-----------------8<------------------

Then when I'm in vim looking@a patch or a change, I just type:

ack<TAB>me<TAB>

or

sob<TAB>me<TAB>

I'm sure this is possible in other editors as well. None is better
then the other; just how I personally handle this stuff.

Hope this is helpful...

> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-Bryan

P.S. I got this idea from Peter Hutterer:
http://who-t.blogspot.com/2010/11/adding-reviewed-by-tags-to-patches.html
He originally had this in ~/.vim/snippets/gitcommit.snippets, but
since I work with more then just git, I added it to mine to the global
snippets.
