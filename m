From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 08 Feb 2016 18:14:04 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
	to umask.sh
In-Reply-To: <20160208175703.5be67c72@free-electrons.com>
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <2274825.xfSUNdnLFA@hardbit> <20160208175703.5be67c72@free-electrons.com>
Message-ID: <1890083.agaboDjt8N@hardbit>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Sounds like a good idea. So I guess it should match [A-Za-z0-9_-]*,
> correct ? Isn't "." part of the allowed characters ?

Correct.  Debian's run-parts effectively ignores files that have a dot 
in their names (I would guess the rationale is something like "avoid 
*.bak, *.old, etc.")

I would rather stick to this behavior, but have no strong opinion.  Do 
you, or others, prefer something else?

> In any case, patches are welcome :)

I'll propose something tomorrow then.  :-)

-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160208/e668b399/attachment.asc>
