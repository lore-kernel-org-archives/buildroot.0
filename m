From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 21:07:58 +0100
Subject: [Buildroot] [git commit] luajit: only available on x86(-64)
 hosts
In-Reply-To: <CAGhdn54e+_wmfbjhJjiq5fDqgcTjZkD_0jpvD7eNXMQefourNQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 6 Nov 2017
 19:01:19 +0100")
References: <20171105155244.192977FB27@busybox.osuosl.org>
 <20171106101232.5ad247cb@windsurf.home>
 <CAGhdn54e+_wmfbjhJjiq5fDqgcTjZkD_0jpvD7eNXMQefourNQ@mail.gmail.com>
Message-ID: <87tvy7w4pt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <fperrad@gmail.com> writes:

 > moarvm could be build without any host lua (Lua or LuaJIT),
 > it embeds its own minilua for bootstrapping.
 > see https://patchwork.ozlabs.org/patch/601314/

Correct, and since 2017.10 you even cannot use an external lua:

https://github.com/MoarVM/MoarVM/blob/master/docs/ChangeLog


-- 
Bye, Peter Korsgaard
