From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:23:16 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
In-Reply-To: <CABbD_XAJ28-rB30H_fjZF6Xn-BTYzU2s+5bODKBP9kvrG0=ByQ@mail.gmail.com>
References: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
 <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
 <54426BB5.6030903@mind.be>
 <CABbD_XBSjcCmHwiVAwA7Ac+H_tFuv_DP9Jp8mfd5KfbuV21pYw@mail.gmail.com>
 <20141018184717.229346e1@free-electrons.com>
 <CABbD_XAJ28-rB30H_fjZF6Xn-BTYzU2s+5bODKBP9kvrG0=ByQ@mail.gmail.com>
Message-ID: <20141018192316.38edab48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Sat, 18 Oct 2014 19:13:11 +0200, K?roly Kasza wrote:

> OK, but this means the changing of the order of dependencies is not at all
> connected with the original purpose of this patch, also everywhere
> else it should be changed I guess.

I agree the order of the dependencies is a separate thing. And it's
also a bit strange to enforce an ordering for this case, while we do
not have such a rule for all other packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
