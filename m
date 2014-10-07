From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 07 Oct 2014 22:58:49 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: Bump version to 1.4.0
References: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
 <87ppe3fwnn.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3BFE9C44990FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in 
news:87ppe3fwnn.fsf at dell.be.48ers.dk:

> Committed all 3, thanks. For future patches, it would be good if you
> would add the tarball hashes as the libva* release announcements had
> them (I've added them now).

Hi,

ok, I will do so.

Until now I did not really bother for my non-security-related packages 
because I remembered the commit description
http://git.buildroot.net/buildroot/commit/support/download/check-hash?id=
9bd8b59526c4521879f0ae5f765cb1a748725c49 where Yann talked about "sensitive 
packages, related to security: openssl, dropbear, ca-certificates...", so I 
thought hashes are optional[1]. It seems I did not notice the change of 
policy regarding hashes.
In other words: Is there a reason _not_ to include a hash for a source 
tarball?

Regards, Bernd

[1] According to the doc
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash
they are still optional ;)
