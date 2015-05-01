From: Mark Mason <mason+buildroot@postdiluvian.org>
Date: Fri, 1 May 2015 13:54:18 -0400
Subject: [Buildroot] grub on target
In-Reply-To: <553FD70B.40209@mind.be>
References: <HKXPR01MB0312A3D64DA648D6B74794C9C2EF0@HKXPR01MB0312.apcprd01.prod.exchangelabs.com>
 <20150422195220.GA19841@postdiluvian.org>
 <20150424174149.GA627@postdiluvian.org> <553FD70B.40209@mind.be>
Message-ID: <20150501175418.GA15939@postdiluvian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Mark,
> 
> On 04/24/15 19:41, Mark Mason wrote:
> > To answer my own question, it looks like I was having some sort of
> > UEFI-related problem, and it was fixed by a newer version of Grub2.
> 
>  Perhaps you'd like to submit a patch to bump grub2 to a newer version?
> 
>  Regards,
>  Arnout

I will do that when I get one.  I needed a working grub immediately,
so I took a newer grubx64.efi off an Ubuntu machine and patched it
with emacs to use the generic paths that I needed.
