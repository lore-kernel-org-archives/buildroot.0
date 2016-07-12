From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 10:47:31 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
	headers >= 3.11
In-Reply-To: <20160711202325.GB5122@free.fr> (Yann E. MORIN's message of "Mon, 
 11 Jul 2016 22:23:26 +0200")
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
 <87eg709ccd.fsf@dell.be.48ers.dk> <20160711202325.GB5122@free.fr>
Message-ID: <87r3az6y58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2016-07-11 21:57 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> > ... since it uses O_TMPFILE as an open(2) flag, and it was only
 >> > introduced in 3.11.
 >> 
 >> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> > Cc: Gabe Evans <gabe@hashrabbit.co>
 >> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 >> Committed, thanks.

 > Had you seen the other patch a bit later, with comments from Thomas,
 > before applying this one?

 > https://patchwork.ozlabs.org/patch/646796/

I hadn't, no. I just did a test build with 3.10 headers and glibc 2.22,
and it built without problems - So I've dropped this patch.

-- 
Venlig hilsen,
Peter Korsgaard 
