From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:31:05 +0100
Subject: [Buildroot] [PATCH v5 07/19] python3: generate reproducible .pyc
In-Reply-To: <1482241596-31688-8-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-8-git-send-email-jezz@sysmic.org>
Message-ID: <20170320233105.4a68dc37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:24 +0100, J?r?me Pouiller wrote:
> .pyc files contain modification time of .py source. In order to make build
> reproducible, we fix modification time of all .py before compiling .pyc files.
> 
> In add, since pycompile rely on modification times to know if a file need to be
> recompiled, it is safer to force recompilation of all source files.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

Applied with the same changes as for PATCH 06/19.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
