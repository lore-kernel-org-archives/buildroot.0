From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 May 2010 20:54:21 +0200
Subject: [Buildroot] git access via http
In-Reply-To: <201005281824.09647.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Fri, 28 May 2010 18:24:09 +0200")
References: <AB12B32E73474741A2C5361C433A44DE01CD4EEB@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<87typstjkx.fsf@macbook.be.48ers.dk>
	<201005281824.09647.yann.morin.1998@anciens.enib.fr>
Message-ID: <87d3wfuaaq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, Phil, All,
 Yann> On Friday 28 May 2010 12:19:10 Peter Korsgaard wrote:
 >> Hmm, seems like git-over-http was never set up by the osuosl.org
 >> people. Is this important for you? The native git protocol is a lot
 >> better.

 Yann> Yes, but in some companies, the policy is to acces the "internet" only
 Yann> through http/https proxies. Some even disallow the 'CONNECT' command to
 Yann> anything else but http/https/ftp, and do not offer socks proxies. These
 Yann> rule out anything but plain http/ftp.

 Yann> So, having buildroot's git available through http would be nice, IMHO.

Ok, I'll ask the osuosl guys to set it up.

-- 
Bye, Peter Korsgaard
