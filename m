From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 00:03:15 +0100
Subject: [Buildroot] [PATCH] busybox: use md5 as default password
 algorithm
In-Reply-To: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160323000315.6f732d8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 16:43:10 -0300, Gustavo Zacarias wrote:
> DES is terribly outdated and a security vulnerability.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

I've (obviously) read the discussion with Peter, but I believe the
issue he is raising is different. We already have our Busybox
configuration default to "des", which is not consistent with the algo
choice made by the user in the Buildroot configuration. So switching to
"md5" is not making things any worse from that perspective.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
