From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 22 Apr 2011 15:23:26 -0500
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <87hb9q9ite.fsf@macbook.be.48ers.dk>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk> <1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk> <1303322103.8512.4.camel@segulix>
	<878vv423zn.fsf@macbook.be.48ers.dk> <1303413743.6641.12.camel@segulix>
	<877hanz56u.fsf@macbook.be.48ers.dk>
	<BANLkTikW4aebOtn_TBzRHQd+7+iYjEWtQQ@mail.gmail.com>
	<87d3keyhy2.fsf@macbook.be.48ers.dk>
	<20110422102559.57825yx5w1jirnk0@www.home.zuerker.org>
	<87hb9q9ite.fsf@macbook.be.48ers.dk>
Message-ID: <20110422152326.16252rqm8u3sfcao@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>
>  >> As I mentioned in my previous mail, I already tried 5.9 and got same
>  >> crash as on 5.8 (arm926, both on glibc and uclibc).
>
>  Heiko> The problem has something to do with readline.
>  Heiko> I tested it against bash and as soon as readline support is off, the
>  Heiko> seg fault disappears.
>
> But if you build without readline support, then bash isn't linked
> against ncurses at all, is it?

I did a quick test compile and you're right.
I'll take back what I said and blame ncurses again. ;-)

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
