From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:59:42 +0200
Subject: [Buildroot] [PATCH autobuild] autobuild-run: libffi is now
 available on ARC
In-Reply-To: <1414230149-2227-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414230149-2227-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141025115942.090a789d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Oct 2014 11:42:29 +0200, Thomas Petazzoni wrote:
> Since commit 34c2afeb750fbbe92e4c00eaa374303bcf5e2584 in Buildroot
> ("libffi: back-port support for ARC"), we have ARC support in libffi,
> so we should no longer prevent configurations having libffi enabled on
> ARC from being used on the autobuilders.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> ---
>  scripts/autobuild-run | 2 --
>  1 file changed, 2 deletions(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
