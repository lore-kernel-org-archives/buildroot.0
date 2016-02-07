From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:19:05 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <249443164.1454061.1454678578498.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
 <20160205140909.764ff2e6@free-electrons.com>
 <249443164.1454061.1454678578498.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160207221905.358caa32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henrique Marks,

On Fri, 5 Feb 2016 11:22:58 -0200 (BRST), Henrique Marks wrote:
> Yes, once the atomic series enter master branch, we are going to proceed on with this patch:
> 
> - Change protobuf, as you stated.
> - Change Dependent Packages, it is four or five last time i checked out.
> - Build on powerpc these packages, with gcc > 4.8

The atomic series has been merged in master. Can you respin this
protobuf patch, taking into account the comments I made?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
