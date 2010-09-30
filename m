From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Sep 2010 21:47:42 +0200
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <4CA4E521.30407@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 30 Sep 2010 16:29:37 -0300")
References: <4CA4A278.6040303@zacarias.com.ar>
	<87ocbfxcsg.fsf@macbook.be.48ers.dk> <4CA4E521.30407@zacarias.com.ar>
Message-ID: <87k4m3xbc1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 09/30/10 16:16, Peter Korsgaard wrote:
 >> I also see that you removed the comment about snmp support being broken
 >> with external toolchains. Is that resolved?

 Gustavo> Forgot about this point, snmp support with external toolchain
 Gustavo> was broken at the net-snmp package (bad staging), so i removed
 Gustavo> the kludge since it's supposedly fixed when i rewrote the
 Gustavo> net-snmp package for autotargets.

Ok, thanks.

Could someone using the external toolchain (Thomas?) give netsnmp a
quick test?

-- 
Bye, Peter Korsgaard
