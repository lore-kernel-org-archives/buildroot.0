From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:17:38 +0100
Subject: [Buildroot] [PATCHv3 33/74] iostat: remove legacy code
In-Reply-To: <1417357142-14307-34-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:21 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-34-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9xf9fr1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Some custom iostat-source target was mistakenly left in place when the
 > iostat package was migrated to gentargets in commit
 > ee77963588b09babfd71befb0b5eb9fd1e776bbc, back 4 years ago. This
 > commit removes this unnecessary custom target.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
