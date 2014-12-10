From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 22:10:06 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <20141210205715.GE3926@free.fr>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141210205715.GE3926@free.fr>
Message-ID: <20141210221006.5ab0d254@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 10 Dec 2014 21:57:15 +0100, Yann E. MORIN wrote:

> Also, the only file that seem to get compiled is:
>     src/extra/fm-xml-file.c
> 
> for which the header states it is LGPLv2.1+.
> 
> So, even if there's only the COPYING for the GPLv2 and that we only
> compile an LGPLv2.1+ file, I'd state both licenses.

I'm not sure here: since some files of the library are under the GPL,
the library as a whole is under the GPL, even though some parts of it
are under other licenses.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
