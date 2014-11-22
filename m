From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 21:44:33 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <CAGm1_kuYptuts7OxWahX3bKi135bfDYYvEVEu=_PdhQ=Q5cfDA@mail.gmail.com>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr>
 <20141122190852.748af912@free-electrons.com>
 <20141122185640.GE4295@free.fr>
 <20141122205900.5aa98365@free-electrons.com>
 <CAGm1_ksOF3MWdjasYp78Xw2O=nH0tbT_jddE0en_F_hnBb=NWg@mail.gmail.com>
 <20141122212416.1f57c59f@free-electrons.com>
 <CAGm1_kuYptuts7OxWahX3bKi135bfDYYvEVEu=_PdhQ=Q5cfDA@mail.gmail.com>
Message-ID: <20141122214433.6d6ca7db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sat, 22 Nov 2014 21:32:36 +0100, Yegor Yefremov wrote:

> I'd add this:
> 
> PYTHON_CERTIFI_LICENSE = Python code: ISC, cacert.pem: MPL

It should be:

PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
