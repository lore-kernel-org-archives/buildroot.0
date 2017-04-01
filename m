From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:13:43 +0200
Subject: [Buildroot] [PATCH 01/21] docs/manual: refer to SPDX License
 List
In-Reply-To: <1490881430-10434-2-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-2-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170401151343.1ec26d03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 19:13:30 +0530, Rahul Bedarkar wrote:
> We want to use SPDX short identifier for license string as much as
> possible. So refer to SPDX license list and use SPDX short identifier
> for license strings in documentation.
> 
> Also remove License abbreviations that we have.
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt       | 12 ++---
>  docs/manual/adding-packages-kernel-module.txt |  4 +-
>  docs/manual/adding-packages-perl.txt          |  2 +-
>  docs/manual/adding-packages-python.txt        |  2 +-
>  docs/manual/legal-notice.txt                  | 75 ---------------------------
>  5 files changed, 10 insertions(+), 85 deletions(-)

Applied to master, after taking into account the suggestions from
Arnout. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
