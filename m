From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:50:09 +0100
Subject: [Buildroot] [PATCH 4/8] arch: ensure BR2_BINFMT_ELF is really
 used
In-Reply-To: <20141211200708.GE4199@free.fr>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141211200708.GE4199@free.fr>
Message-ID: <20141211225009.49b138c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 21:07:08 +0100, Yann E. MORIN wrote:

> Even though BR2_BINFMT_ELF is never used, but we need it in the choice.
> Just out of curiosity, do you plan on needing it in a future patch?

Well it is needed in PATCH 5/8 to make sure that
BR2_BINFMT_SUPPORTS_SHARED is selected on ELF based systems.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
