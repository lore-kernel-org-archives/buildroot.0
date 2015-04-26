From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:22:54 +0200
Subject: [Buildroot] [PATCHv4 07/18] pkg-generic: implement source-check
 targets
In-Reply-To: <20150426152028.GE4809@free.fr>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150426152028.GE4809@free.fr>
Message-ID: <20150426222254.726f5c98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Apr 2015 17:20:28 +0200, Yann E. MORIN wrote:

> Why don;t you split this inside the OVERRIDE_SRCDIR condition, just
> above, along with the current $(1)-source ?

Good idea. I've changed that before applying. Thanks for the suggestion!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
