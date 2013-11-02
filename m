From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Nov 2013 14:08:41 +0100
Subject: [Buildroot] [PATCH 2 of 2] git packages: use full revision hash
In-Reply-To: <b57165ad4599fd73ccfc.1383394318@argentina>
References: <patchbomb.1383394316@argentina>
 <b57165ad4599fd73ccfc.1383394318@argentina>
Message-ID: <CAHXCMM+u5dSZ0wHENfq2mwPQ3mwqY-_ceBx0emP1M2tDafJBZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/2 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> There is no benefit in using the shortened git revision hash. On the
> contrary: the shorter the hash, the higher the risk of having collisions
> with another commit.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/74784e53/attachment.html>
