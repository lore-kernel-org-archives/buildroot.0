From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 12:49:00 +0100
Subject: [Buildroot] [PATCH v5 1/1] doom-wad: bump to version 1.9
In-Reply-To: <1450956934-18354-1-git-send-email-rprebello@gmail.com>
References: <1450956934-18354-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151224124900.3687b86f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Thu, 24 Dec 2015 09:35:34 -0200, Rodrigo Rebello wrote:
> Also add a hash file.
> 
> The extraction method had to be changed, since the WAD file for this
> version is not distributed as a stand-alone file, but comes inside a
> 2-part DOS self-extracting zip archive.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v1 -> v2:
>   - Upgrade shareware Doom WAD file to the latest 1.9 version. This
>     allows dropping the comment in the next commit about having to pass
>     the option "-gameversion 1.8" to the chocolate-doom-* executables.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
