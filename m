From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 22 Feb 2014 21:58:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] mpg123: needs MMU
In-Reply-To: <87y512sx6g.fsf@dell.be.48ers.dk>
References: <1393100684-5488-1-git-send-email-rjbarnet@rockwellcollins.com>
 <87y512sx6g.fsf@dell.be.48ers.dk>
Message-ID: <CALq67GDg1wZuU_M_=M+cjZNFrrf0gBNfegwJbXDf4fzEJnetpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sat, Feb 22, 2014 at 9:35 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> All of gstreamer1 depends on mmu (because of glib), so this is not
> really needed, but OK.

That is what I meant to say. Sorry for the confusion!

Thanks,
-Ryan
