From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 31 Oct 2007 20:43:41 +1100
Subject: [Buildroot] make error with Kismet even if not selected
In-Reply-To: <13504645.post@talk.nabble.com>
References: <20071030091652.2D272A67F9@busybox.net>
	<47273782.1000900@linuxtv.org> <13504645.post@talk.nabble.com>
Message-ID: <20071031094341.GA20152@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 31, 2007 at 01:21:54AM -0700, Hebbar wrote:
>  i get an error as below when "make world" is given. This is with todays
> buildroot snapshot i havent selected kismet in network utilities section.
> still kismet tries to download and build.

Noted in bug#1557, and my patch to fix it is in that report too.

http://bugs.uclibc.org/view.php?id=1557


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
