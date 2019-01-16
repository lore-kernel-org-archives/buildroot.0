From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:17:24 +0100
Subject: [Buildroot] [PATCH] utils/check-package: use explicit relative
 imports
In-Reply-To: <20190115171545.8337-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Tue, 15 Jan 2019 18:15:45 +0100")
References: <20190115171545.8337-1-titouan.christophe@railnova.eu>
Message-ID: <87lg3k9rij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > The syntax for explicit relative imports was introduced in
 > Python2.6, and the implicit relative imports were removed
 > in Python3.

 > According to PEP394, Python source files that use the `python`
 > shebang line should be compatible with both Python2 and Python3.
 > With this patch, users of distros where Python3 is the default
 > are able to use check-package

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Thanks, but I have instead applied Ricardo's patch:

https://patchwork.ozlabs.org/patch/956517/


-- 
Bye, Peter Korsgaard
