From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Oct 2018 21:24:15 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <8957d098-dabe-b173-53ed-9e0db256d521@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 10/10/2018 17:48, Thomas Petazzoni ha scritto:>>           arm | 
               netsnmp-5.8 | NOK | 
http://autobuild.buildroot.net/results/9f02e0f09ae2d2a66a8d33d73f1bdd45ea8b0f16 
| ORPH
> 
> configure: error: The DTLS based transports require the libssl library from OpenSSL to be available and support DTLS
> 
> Bernd, you did the last version bump of netsnmp, could you have a look ?

I've submitted this patch for this:
https://patchwork.ozlabs.org/patch/970818/ that solves the build failure 
above.

Bernd, please can you check it?
It works for me.
Is it formed ok that patch? (commit log, patches etc.)
I'm still waiting for 1 patch to be upstreamed.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
