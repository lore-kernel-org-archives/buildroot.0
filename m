From: Ja Bi <Bi.Ja@seznam.cz>
Date: Tue, 02 Dec 2014 17:24:41 +0100 (CET)
Subject: [Buildroot] Crypto algorithms in buildroot
References: <lb1.NaXB.3cxqHjbWLxJ.1KVPDw@seznam.cz>
 <547DA34A.6080909@zacarias.com.ar>
Message-ID: <o7v.NaZt.2WB7vfT4NPt.1KVUV9@seznam.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aha, so it is a bit like gentoo-linux? (but build cc inside that chain?)?



So if i install openssl, there is package downloaded from openssl cc-
compiled and installed to that new root?




thanks a lot

Jan

---------- P?vodn? zpr?va ----------
Od: Gustavo Zacarias <gustavo@zacarias.com.ar>
Komu: Ja Bi <Bi.Ja@seznam.cz>, buildroot at busybox.net
Datum: 2. 12. 2014 12:42:11
P?edm?t: Re: [Buildroot] Crypto algorithms in buildroot

"On 12/02/2014 07:24 AM, Ja Bi wrote:

> Hi guys,
> 
> I would like to know which cryptography algorithms are used
> in buildroot? There is some version of openssl but not the binary
> openssl that i could use to ask.
> And other thing is kernel cryptography algorithms. Is it only in
> /proc/crypto (and unloaded modules)?
> 
> Are there any others? sshd?
> 
> thank you very much
> 
> Jan
> 
> PS: I post it again because ehm... i forgot to fill in subject...:(

Hi.
Buildroot doesn't use any crypto algorithms by itself except to check
hashes of downloaded files for integrity.
Your question sounds a little bit vague, what are you trying to say/do?
It seems to be related to the target rather than buildroot itself.
Regards."
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141202/29a95a3f/attachment.html>
