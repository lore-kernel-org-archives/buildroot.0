From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 12:23:37 +0100
Subject: [Buildroot] [PATCH] wireshark: explicitly disable libsmi
In-Reply-To: <e3a671643f7a6f4508e3abeec73ae3bec032834f.1362300524.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 3 Mar 2013 10:55:44 +0200")
References: <e3a671643f7a6f4508e3abeec73ae3bec032834f.1362300524.git.baruch@tkos.co.il>
Message-ID: <87hakrcssm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> wireshark's libsmi detection is not cross compile friendly. We
 Baruch> don't have libsmi in Buildroot yet anyway, so just disable
 Baruch> support for it in wireshark.

Committed, thanks.

-- 
Bye, Peter Korsgaard
