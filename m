From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 21:47:47 +0100
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: stop mixing echo and
	printf (use echo)
In-Reply-To: <1390416532-2328-1-git-send-email-bjorn.forsman@gmail.com>
 (=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Wed, 22 Jan 2014 19:48:52
 +0100")
References: <1390416532-2328-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <871tzzeob0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 > 'printf' was introduced because it is more portable than 'echo -e'. But
 > when the escape sequences are just newlines we can just as well use
 > plain 'echo' (and remove the newline escape sequences).

 > This looks cleaner than having some lines with echo and some with
 > printf.

 > Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
