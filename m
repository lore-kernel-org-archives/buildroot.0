From: Nick Peirson <nick@netcentral.co.uk>
Date: Mon, 6 Oct 2008 17:20:58 +0100
Subject: [Buildroot] proftpd does not compile
In-Reply-To: <gcdcjp$v98$1@ger.gmane.org>
References: <gc8fta$bif$1@ger.gmane.org> <48E9CB77.8060808@netcentral.co.uk>
	<gcdcjp$v98$1@ger.gmane.org>
Message-ID: <48EA3AEA.7070206@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha Nelissen wrote:
> I'm not sure if you understood me right. The problem is that bcopy is
> declared twice (I get a redefinition warning). It is *not* that bcopy is
> undefined.
>
> If I'm wrong please correct me, thanks.
>   

I think I misunderstood you. It looks like there was a patch to resolve 
bcopy related issues in the buildroot repository, but it was removed:
http://busybox.net/lists/buildroot/2008-June/009198.html

Not sure if it helps it would help with the issue your seeing or not?

-- 
Regards

Nick Peirson

--
Internet Central Ltd is a limited company registered in England. Registered number: 3079542. Registered office: Ivy House Foundry, Hanley, Stoke-on-Trent ST1 3NR.

This message is private and confidential. If you have received this message in error, please notify us and remove it from your system.
