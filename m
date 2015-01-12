From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 23:04:41 +0100
Subject: [Buildroot] [PATCHv4 2/4] skeleton/S40network: tweak for debian
 ifupdown
In-Reply-To: <1417107630-14909-3-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150112230441.08fdd52d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Nov 2014 14:00:28 -0300, Gustavo Zacarias wrote:
> Make the S40network script create the /run/network directory for the
> debian variant of ifupdown which uses it as a lock directory.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  system/skeleton/etc/init.d/S40network | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
