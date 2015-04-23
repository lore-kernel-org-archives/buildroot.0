From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:44:26 -0300
Subject: [Buildroot] [PATCH v7 8/8] support/download: restore mandatory
	check of hashes
In-Reply-To: <1429740521-31943-9-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
 <1429740521-31943-9-git-send-email-arnout@mind.be>
Message-ID: <553886BA.4000503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2015 07:08 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Now that custom external toolchains to be downloaded properly instruct
> to not fail on a missing hash, restore the mandatory hash check for
> everything else.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
