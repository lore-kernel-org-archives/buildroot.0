From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 14:26:24 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
 headers >= 3.11
In-Reply-To: <87r3az6y58.fsf@dell.be.48ers.dk>
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
 <87eg709ccd.fsf@dell.be.48ers.dk> <20160711202325.GB5122@free.fr>
 <87r3az6y58.fsf@dell.be.48ers.dk>
Message-ID: <20160716142624.1e045c31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:47:31 +0200, Peter Korsgaard wrote:

> I hadn't, no. I just did a test build with 3.10 headers and glibc 2.22,
> and it built without problems - So I've dropped this patch.

So the comment from Yann in https://patchwork.ozlabs.org/patch/646796/
that both were needed is incorrect?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
