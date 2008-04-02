From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 02 Apr 2008 14:45:22 +0000
Subject: [Buildroot] Segmentation error with OpenSSH
In-Reply-To: <823018ed0804020741y55c7cb93k97f1aa75ee97a6dc@mail.gmail.com>
References: <823018ed0804020741y55c7cb93k97f1aa75ee97a6dc@mail.gmail.com>
Message-ID: <1207147522.2513.163.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> I used buildroot to compile a root filesystem and selected openssh
> from menuconfig.
> The system boots up fine, until it wants to generate a RSA and DSA
> key, where it
> receives a segmentation fault. Also when you run 'ssh' from the command line it
> gives a segmentation fault.
> 
> What can the problem be here? Do I need to select additional packages
> for it to work?
> If so what additional packages?

What arch? 

Are you using the old stable linux threads or the new ones?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080402/b606d7d0/attachment.pgp 
