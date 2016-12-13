From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Dec 2016 16:54:47 -0200
Subject: [Buildroot] [PATCH] mx6sx: Add support for mx6sx udoo neo boards
In-Reply-To: <87d1gv3bxb.fsf@dell.be.48ers.dk>
References: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com>
 <87d1gv3bxb.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5AR8AAncxBqH_5X7bJpNC9RkEYQ1VkY6_RHPv+2sO+Mtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 13, 2016 at 4:45 PM, Peter Korsgaard <peter@korsgaard.com> wrote:

> As you already pass console=ttymxc0 then I believe the default
> (/dev/console) should work as well.

I will give it a try tomorrow, thanks for the hint.

> Committed, thanks. Will you send a patch to move the existing
> board/udoo/* files to E.G. board/udoo/mx6 for consistency?

Good point. Will do as suggested, thanks.
