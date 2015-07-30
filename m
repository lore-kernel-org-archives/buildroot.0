From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jul 2015 18:37:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/golang: new package
In-Reply-To: <1438209421-4625-1-git-send-email-christian@paral.in>
References: <1438209421-4625-1-git-send-email-christian@paral.in>
Message-ID: <20150730163753.GB3744@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-29 15:37 -0700, Christian Stewart spake thusly:
> This patch adds golang, the Go compiler-and-interpreter.

Please, do not resend so fast.

After a review, it is usually good to wait a bit, to give others a
chance to review, too.

Re-sending too fast means others would review the previous iteration
(bad) but that you would also have a lot of re-spin to do. Also,
potential reviewr (and committer) may get wary of this many respins.

I know you are probably eager to see that merged soon, but re-sending
too fast is not the best way to make that happen.

Unless the committer asks for a simple fixup and a prompt respin, of
course. Otherwise, let it settle for a day...

Beside, in that case, your respin is not correct, because it does not
address the rm-rf that Thomas pointed out, so I'll have to repin my
version...

Don't get me wrong: I too am eager to see it merged, and we all do
appreciate your work on this! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
