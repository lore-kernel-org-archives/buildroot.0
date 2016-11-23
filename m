From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:09:39 +0100
Subject: [Buildroot] [PATCH v4 14/18] python3: generate reproducible .pyc
In-Reply-To: <1479905937-17241-15-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-15-git-send-email-jezz@sysmic.org>
Message-ID: <20161123230939.62c3f549@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:53 +0100, J?r?me Pouiller wrote:
> .pyc files contain modification time of .py source. In order to make
> build reproducible, we fix modification time of all .py before to
> compile .pyc files.

Is there a way of avoiding the modification time contained inside
the .pyc files? According to
http://wiki.baserock.org/projects/deterministic-builds/: "Debian solve
this by creating the .pyc and .pyo files at package install time",
which is essentially what we do. How do they handle this exactly?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
