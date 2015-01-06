From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 22:05:02 +0100
Subject: [Buildroot] [PATCH] elfutils: bump version to 0.161
In-Reply-To: <1420545726-23272-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420545726-23272-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150106220502.5ffdc6d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 6 Jan 2015 12:02:06 +0000, Vicente Olivert Riera wrote:
> - Bump version to 0.161
> - Remove the portability patch. We don't need to have it in Buildroot
>   since it includes the version number so we can download it safely
>   without having collisions between versions.
> - Adapt the patches that need to be adapted.
> - Rename patches to start from 0001.
> - Update the hash value and add a new value for the portability patch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
