From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 02 Dec 2014 08:32:26 -0300
Subject: [Buildroot] Crypto algorithms in buildroot
In-Reply-To: <lb1.NaXB.3cxqHjbWLxJ.1KVPDw@seznam.cz>
References: <lb1.NaXB.3cxqHjbWLxJ.1KVPDw@seznam.cz>
Message-ID: <547DA34A.6080909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2014 07:24 AM, Ja Bi wrote:

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
Regards.
