From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 08 May 2011 16:07:42 -0500
Subject: [Buildroot] PATH
In-Reply-To: <87mxixj6bb.fsf@macbook.be.48ers.dk>
References: <20110508081440.78203647owixiiio@www.home.zuerker.org>
	<201105081523.44670.yann.morin.1998@anciens.enib.fr>
	<87mxixj6bb.fsf@macbook.be.48ers.dk>
Message-ID: <20110508160742.Horde.pzUbY2ms4ABNxwYeJsYE0SA@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Quoting Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
>
>  Yann> Heiko, All,
>  Yann> On Sunday 08 May 2011 15:14:40 Heiko Zuerker wrote:
>  >> I'm almost done with the MySQL 5.5 script, but it requires ./ in  
> the path.
>  >> It may not be a bad idea to add this to Makefile.in (TARGET_PATH,
>  >> HOST_PATH), in case other packages have a similar behavior.
>  >> Thoughts?
>  >> (Worst case I'll just keep it in the mysql.mk)
>
>  Yann> In my opinion, . in the path is a Really Bad Idea (TM), and should not
>  Yann> only be avoided, but entirely banned.
>
> I agree. I'm surprised to hear that mysql needs it.

5.1 is fine, it's 5.5 which needs it.
I'll look into writing a patch, but it could be a little while until I  
get to it.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
