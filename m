From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:34:40 +0100
Subject: [Buildroot] [PATCH 0/3] slang: fix static builds
In-Reply-To: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141209203440.53026bbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 9 Dec 2014 11:51:18 +0000, Vicente Olivert Riera wrote:
> - Rename current patches to follow the new name convention.
> - Adapt upstream patches to allow building only the static library and a
>   static version of slsh.
> - Use specific build and install commands when doing static builds.
> 
> Vicente Olivert Riera (3):
>   slang: rename patches to follow the new name convention
>   slang: add adapted upstream patches for static builds
>   slang: use specific build and install commands for static builds

All three patches applied, thanks. The last two patches could have been
only one since they are both needed to fix the static linking problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
