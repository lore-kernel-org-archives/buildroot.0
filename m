From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:20:57 +0200
Subject: [Buildroot] [PATCH] libkcapi: fix build with gcc 7.x
In-Reply-To: <1503911719-25545-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1503911719-25545-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20170829232057.5fb1a8d0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 11:15:19 +0200, Marcin Nowakowski wrote:
> Add an upstream patch to make libkcapi build with gcc 7.x.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/01f/01f207ccd1cf5fc030510cb7a4eb2649e124b49b/
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  ...1-Have-sufficient-memory-size-for-message.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
