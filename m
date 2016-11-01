From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:20:23 +0100
Subject: [Buildroot] [PATCH 1/1] motion: fix static link with gnutls
In-Reply-To: <1477858200-20878-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477858200-20878-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161101162023.31c6781a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 21:10:00 +0100, Fabrice Fontaine wrote:
> base64_encode is already defined in gnutls so rename it as
> motion_base64_encode to prevent a definition clash when linking
> statically with gnutls
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/592672b8826f4c731c50d29725da964d876573c4
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/motion/0002-Rename-base64_encode.patch | 113 +++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 package/motion/0002-Rename-base64_encode.patch

Applied to master, thanks. As noted by Yann, I've added a note in the
patch itself that it has been applied upstream, with the appropriate
reference.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
