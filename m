From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:29:59 +0100
Subject: [Buildroot] [PATCH v5 05/19] pycompile: allow to force
 compilation
In-Reply-To: <1482241596-31688-6-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-6-git-send-email-jezz@sysmic.org>
Message-ID: <20170320232959.0ea01b8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:22 +0100, J?r?me Pouiller wrote:
> By default, compile_dir() rely on modification time to know if a python file
> have to be built again. However in some circumstances (when doing reproducible
> builds), modification times are not reliable. Thus, this patch add a way to
> force rebuild of all python sources.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
