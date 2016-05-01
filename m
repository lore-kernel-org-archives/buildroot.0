From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 15:08:24 +0200
Subject: [Buildroot] [PATCH v2 2/4] python: align the target finalize
 hooks with python3
In-Reply-To: <CAHXCMMKzWEQmZsKXQTEaVgupRWNLztjiaztm2YRu=r-PCiVPmA@mail.gmail.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020471-29986-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKHp7PcbRxaCCqyd3A=qTKsCCxToZfG=UcKZ7CAP4Wpgw@mail.gmail.com>
 <20160501093621.38e0d60d@free-electrons.com>
 <CAHXCMMKzWEQmZsKXQTEaVgupRWNLztjiaztm2YRu=r-PCiVPmA@mail.gmail.com>
Message-ID: <20160501150824.199421db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 May 2016 09:38:36 +0200, Samuel Martin wrote:

> > Hum, correct. So like I'm unconditionally removing *.opt-<X>.pyc for
> > Python 3, I should remove unconditionally *.pyo for the Python case.
> > Would this be OK for you?  
> Yes.

OK, I'll send a follow-up patch to address this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
