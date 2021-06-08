From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 8 Jun 2021 22:08:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind fix version number
In-Reply-To: <20210608120211.7645813d@windsurf>
References: <20210608085332.19296-1-br015@umbiko.net>
 <20210608120211.7645813d@windsurf>
Message-ID: <YL/OP2P9bPRbsRAV@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Andreas,

> Hello,

> On Tue,  8 Jun 2021 10:53:32 +0200
> Andreas Ziegler <br015@umbiko.net> wrote:

> > Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for rpcbind but also changed the version number to a non-existing value. 

> > Change rpcbind to last released version and adapt hash value. 

> > Signed-off-by: Andreas Ziegler <br015@umbiko.net>

> Indeed. This is weird. Petr, do you know where/how you found this 1.3.2
> version of rpcbind ?
I'm sorry, my commit d13b292cec was completely wrong. I got confused with
libtirpc update. I usually test well my patches, because I keep basic errors,
this one I didn't test, which would catch both errors.

Yes, correct version 1.2.6. I also didn't update hash, thank you Andreas for
fixing both.

Kind regards,
Petr

> Thomas
