From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Sep 2010 16:29:37 -0300
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <87ocbfxcsg.fsf@macbook.be.48ers.dk>
References: <4CA4A278.6040303@zacarias.com.ar>
	<87ocbfxcsg.fsf@macbook.be.48ers.dk>
Message-ID: <4CA4E521.30407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/30/10 16:16, Peter Korsgaard wrote:

> I also see that you removed the comment about snmp support being broken
> with external toolchains. Is that resolved?

Forgot about this point, snmp support with external toolchain was broken
at the net-snmp package (bad staging), so i removed the kludge since
it's supposedly fixed when i rewrote the net-snmp package for autotargets.
