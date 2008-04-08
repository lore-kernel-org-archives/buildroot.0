From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 08 Apr 2008 19:17:22 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
In-Reply-To: <87abk4i361.fsf@macbook.be.48ers.dk>
References: <20080408174730.2CAEB3C379@busybox.net>
	<87abk4i361.fsf@macbook.be.48ers.dk>
Message-ID: <1207682242.6817.277.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Is that good? Generating keys takes a LONG time on most embedded
> systems, so having a bit of feedback would be good.

I can add something about generating keys on the same line?

Staring dropbear sshd: generating host keys...OK

how does that look? normal startup would be...

Starting dropbear sshd: OK


>  nkukard> Modified:
>  nkukard>    trunk/buildroot/package/dropbear/dropbear-init.patch
> 
> Having this init script as a patch is kinda silly, let's simply add it
> under package/dropbear and copy it over to TARGET_DIR, E.G. like it's
> done for avahi.
> 
> (Yes, I know you didn't add the patch in the first place).

Duly noted, will add in my next commit together with a fix for the
above.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080408/caa944a0/attachment.pgp 
