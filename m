From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 10 Oct 2008 12:59:15 +0200
Subject: [Buildroot] openssl error
In-Reply-To: <88372fcb0810090804n520b72d3hf2160d5cf7b4f802@mail.gmail.com>
References: <88372fcb0810090151s1f9650b1u17252c27f9899d65@mail.gmail.com>	
	<48EE0394.90003@cetrtapot.si>
	<88372fcb0810090804n520b72d3hf2160d5cf7b4f802@mail.gmail.com>
Message-ID: <48EF3583.9020107@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Lerch wrote:
> I have enabled this option, but the problem persists.

Maybe your arch is forcing it to no (like for cris) or some package selects/de-selects it. See Kconfig files that select BR2_LARGEFILE.

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
