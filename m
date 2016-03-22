From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:08:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error with
 perl 5.22
In-Reply-To: <1458683149-6200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458683149-6200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160322230806.4f4850f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 22:45:49 +0100, Bernd Kuhls wrote:
> Bug was already reported upstream, as solution upstream refered to this
> commit: https://www.nlnetlabs.nl/bugs-script/show_bug.cgi?id=733#c2
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libldns/0003-doxyparse-manpages.patch | 117 ++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 package/libldns/0003-doxyparse-manpages.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
