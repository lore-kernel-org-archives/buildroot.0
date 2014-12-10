From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 22:31:29 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <20141210212821.GI3926@free.fr>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141210205715.GE3926@free.fr>
 <20141210221006.5ab0d254@free-electrons.com>
 <20141210212821.GI3926@free.fr>
Message-ID: <20141210223129.358afb43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 10 Dec 2014 22:28:21 +0100, Yann E. MORIN wrote:

> Yes, the GPL gobbles up the LGPL, because of its stronger requirements.
> But licensing wise, they are both applicable licenses.
> 
> Even worse in this case, the resulting combination is probably just
> LGPLv2.1+, since the only compiled file is LGPLv2.1+.

Ah, indeed if the only compiled files are LGPLv2.1+, then the
<pkg>_LICENSE should state that, because it's quite important. Usually
something like LGPLv2.1+ (library), GPLv2+ (<some other stuff>).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
