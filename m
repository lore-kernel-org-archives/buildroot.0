From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 20:31:11 +0100
Subject: [Buildroot] [PATCH 1/3] dmalloc: Force arm mode instead of
 Thumb1 mode
In-Reply-To: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150125203111.23d005b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Tue, 20 Jan 2015 12:24:37 +0100, Richard Genoud wrote:
> dmalloc has some assembly that doesn't exist in thumb1 mode.
> So, force arm mode for dmalloc.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  package/dmalloc/dmalloc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks.

Are you actually using an ARMv4/ARMv5 Thumb system?

Maybe this is a configuration we should add to our autobuilders, since
it's currently not even build-tested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
