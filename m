From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 8 Dec 2015 12:27:52 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <87poygnb6l.fsf@dell.be.48ers.dk>
References: <20151207185106.GF11489@vapier.lan>
 <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan>
 <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan>
 <20151207230201.GG14874@free.fr>
 <20151207232256.GD24430@vapier.lan>
 <876109nzql.fsf@dell.be.48ers.dk>
 <20151208164023.GL11489@vapier.lan>
 <87poygnb6l.fsf@dell.be.48ers.dk>
Message-ID: <20151208172752.GM11489@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08 Dec 2015 17:43, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  >> I don't believe we will ever bootstrap wget, but we might add
>  >> --no-check-certificates in the future (with the download hashes,
>  >> checking certificates doesn't add much).
> 
>  > except there is no checking on the initial download.
> 
> With initial download I take it you mean Buildroot, right? That we have
> alternatives for (gpg signatures, git clones, download though browser) -
> But sources.buildroot.{net,org} is almost exclusively used by wget, so I
> prefer to not break it for non-sni capable versions.

realistically, how many people do you think actually leverage gpg
signatures ?  having transparent https is better imo than people
running old insecure setups and just telling them to use the one
flag when downloading the initial file.  if they're running wget,
then they're probably reading some doc right ?  just put a foot
note in there mentioning the flag and old clients.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151208/8af0243f/attachment.asc>
