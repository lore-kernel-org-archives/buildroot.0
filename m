From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 00:05:46 +0100
Subject: [Buildroot] [PATCH 2/2] python3: Bump version to 3.6.0
In-Reply-To: <20170306224852.30968-2-andrew.smirnov@gmail.com>
References: <20170306224852.30968-1-andrew.smirnov@gmail.com>
 <20170306224852.30968-2-andrew.smirnov@gmail.com>
Message-ID: <20170308000546.6f63414e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 14:48:52 -0800, Andrey Smirnov wrote:
> Update all appropriate version numbers as well as SHAs and MD5s as well
> as repbasing BR's patches on top of 3.6.0 codebase (new github repo
> tree, v3.6.0 tag was used). Note that patches:
> 
> [PATCH] Change the install location of _sysconfigdata.py
> [PATCH] distutils/sysconfig: use sysconfigdata
> 
> were dropped from the patchset since 3.6.0 codebase doesn't seem like it
> has the problem that aforementioned patches were solving.

It would be nice to have more details on how this sysconfigdata thing
changed. I don't remember the details (it's been a long time), but I
remember that thing being particularly being, so I would like to be
extra cautious when getting rid of patches in the python(3) packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
