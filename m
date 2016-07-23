From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:05:56 +0200
Subject: [Buildroot] [PATCH] package/elementary: provide the path to
 elementary_codgen
In-Reply-To: <1469226160-26379-1-git-send-email-romain.naour@gmail.com>
References: <1469226160-26379-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160723150556.15baf63c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 00:22:40 +0200, Romain Naour wrote:
> elementary_codgen tool is build for the host, so use it while building
> elementary for the target.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/elementary/elementary.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
