From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 23:54:10 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <6FDD64E6-B998-4761-BABC-319E2B21EEB2@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <20160220192418.08424caa@free-electrons.com>
 <6FDD64E6-B998-4761-BABC-319E2B21EEB2@troodon-software.com>
Message-ID: <20160220235410.0e240a1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

On Sat, 20 Feb 2016 13:31:47 -0500, Frank Hunleth wrote:

> Thanks for applying some of the Erlang patches. I've had a really
> busy week, but as soon as I get back today, I'll see what's missing
> and send a patch set with any residual changes that didn't make your
> cut. I know that I had several changes that various people had
> requested.

No problem. I've applied all of them, but had to do some changes on a
few of them (I've replied to each patch individually to let you know).
Please double check my change on the fast_tls vs. p1-tls dependency
change in p1-stun.

I have left on the side the ejabberd update for the moment, since
Romain had some comments. I'll mark this patch as "Changes Requested",
so please respin.

Regarding the erlang atomic operations patch, I haven't had a look yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
