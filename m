From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 17:43:14 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151208164023.GL11489@vapier.lan> (Mike Frysinger's message of
 "Tue, 8 Dec 2015 11:40:23 -0500")
References: <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk> <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk> <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk> <20151207225408.GC24430@vapier.lan>
 <20151207230201.GG14874@free.fr> <20151207232256.GD24430@vapier.lan>
 <876109nzql.fsf@dell.be.48ers.dk> <20151208164023.GL11489@vapier.lan>
Message-ID: <87poygnb6l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 >> I don't believe we will ever bootstrap wget, but we might add
 >> --no-check-certificates in the future (with the download hashes,
 >> checking certificates doesn't add much).

 > except there is no checking on the initial download.

With initial download I take it you mean Buildroot, right? That we have
alternatives for (gpg signatures, git clones, download though browser) -
But sources.buildroot.{net,org} is almost exclusively used by wget, so I
prefer to not break it for non-sni capable versions.

-- 
Venlig hilsen,
Peter Korsgaard 
