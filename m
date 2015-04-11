From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 18:04:17 +0200
Subject: [Buildroot] [PATCH v2 0/2] Makedevs: add recursive option
In-Reply-To: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150411180417.7e34b00b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sat, 11 Apr 2015 15:40:30 +0200, Angelo Compagnucci wrote:
> This patch series add the recursive option to makedevs.
> 
> With recursive option will be possible to apply owner/permission
> recursively to folders.
> 
> Angelo Compagnucci (2):
>   package/makedevs: add recursive option
>   docs/manual: documentation for recursive makedevs syntax
> 
>  docs/manual/makedev-syntax.txt | 10 +++++++++-
>  package/makedevs/makedevs.c    | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)

Both patches applied, after s/folder/directory/, as suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
