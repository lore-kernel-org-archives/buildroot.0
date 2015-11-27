From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Nov 2015 16:19:01 +0100
Subject: [Buildroot] [PATCH] espeak: fix build on sparc64
In-Reply-To: <56586A2F.3040905@zacarias.com.ar>
References: <1448634261-6630-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <56586A2F.3040905@zacarias.com.ar>
Message-ID: <20151127161901.18e741c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Fri, 27 Nov 2015 11:35:27 -0300, Gustavo Zacarias wrote:

> I wonder if all these sparc fixes wouldn't be better suited for the 
> wrapper, after all -fpic in sparc is generally useless, and try to 
> handle these upstream would be a PITA.

This is indeed another possibility. Generally speaking, I am not a huge
fan of hiding too much magic/sorcery in the wrapper. But it's already a
big amount of black magic, so a little bit more or less maybe does not
hurt that much.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
