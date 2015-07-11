From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:27:53 +0200
Subject: [Buildroot] [PATCH] postgresql: init script: wait till server
 has started
In-Reply-To: <1432574426-17098-2-git-send-email-bos@je-eigen-domein.nl>
References: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
 <1432574426-17098-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150711092753.76730e0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, 25 May 2015 19:20:26 +0200, Floris Bos wrote:
> Adds "-w" option to init script to wait till the database server
> has fully started and accepts connections before continuing.
> 
> Prevents other applications that depend on PostgreSQL from
> failing to start, if the database server is not ready yet.
> Times out after 60 seconds by default.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/postgresql/S50postgresql | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
