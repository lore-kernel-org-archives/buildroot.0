From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 20:35:47 +1300
Subject: [Buildroot] [PATCH v5 03/19] core: do not reset
 DEPENDENCIES_HOST_PREREQ in dependencies.mk
In-Reply-To: <1482241596-31688-4-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-4-git-send-email-jezz@sysmic.org>
Message-ID: <20170128203547.464f0623@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:20 +0100, J?r?me Pouiller wrote:
> Usually, Buildroot does never initialize variables with empty content.
> DEPENDENCIES_HOST_PREREQ was an unjustified exception.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
