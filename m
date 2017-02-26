From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:38:07 +0100
Subject: [Buildroot] [PATCH] openssh: Move key generation to the start
 function of init script.
In-Reply-To: <20170224142623.yldyeed3aif3w6de@zenon.in.qult.net>
References: <20170224142623.yldyeed3aif3w6de@zenon.in.qult.net>
Message-ID: <20170226143807.7b56f73e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 15:26:24 +0100, Ignacy Gaw?dzki wrote:
> Since there's not much point in generating missing host keys when the
> init script is called with "stop", the call to ssh-keygen should not
> be done inconditionally, but in the start function instead.
> 
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  package/openssh/S50sshd | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
