From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 25 Feb 2011 12:50:52 +0100
Subject: [Buildroot] Unable to login to buildroot [SOLVED]
In-Reply-To: <818976D2341E8345BAE1673D4C4C4D88017C0D5E@mlbe2k10.cs.myharris.net>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<201102241516.22825.dargaud@lpsc.in2p3.fr>
	<818976D2341E8345BAE1673D4C4C4D88017C0D5E@mlbe2k10.cs.myharris.net>
Message-ID: <201102251250.52341.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 24 February 2011 16:15:29 Williams, Michael (mwilli60) wrote:
> In the end, it turned out to be a floating-point support configuration
> mismatch between buildroot and my old kernel (2.6.24). After changing
> everything to a soft FPU on the old kernel and the buildroot toolchain,
> it all worked.

Yup, that was it. It works now and I'm gonna start using oprofile to fight my 
original issue (slow network).
-- 
Guillaume Dargaud
http://www.gdargaud.net/
