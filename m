From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 12:24:16 +0200
Subject: [Buildroot] [PATCH] linknx: deprecate the package
In-Reply-To: <20160819214521.GB6096@free.fr>
References: <1471554442-4397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160819214521.GB6096@free.fr>
Message-ID: <20160820122416.714d922f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 23:45:21 +0200, Yann E. MORIN wrote:

> I just patched it to drop a musl compatibility patch... Sob... :.-/

You were so sad to see this package being deprecated that I decided to
have a closer look. In the end:

 1/ The issue was easy enough.

 2/ I found some activity upstream on Github at
    https://github.com/linknx/linknx, so I was even able to submit the
    fix upstream.

So issue fixed as of
https://git.buildroot.org/buildroot/commit/?id=780a88bc97294575c23c4f17513009d84c1bb4d2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
