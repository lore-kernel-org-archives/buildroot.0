From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:43:17 -0300
Subject: [Buildroot] [PATCH v7 7/8] package/uclibc: ignore missing hash
	for snapshots
In-Reply-To: <1429740521-31943-8-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
 <1429740521-31943-8-git-send-email-arnout@mind.be>
Message-ID: <55388675.8080603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2015 07:08 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> We can't have a hash for snapshots, so add them to the exclusion list.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v1 -> v6: (Arnout)
>   - use $(UCLIBC_SOURCE) instead of a wrong filename
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
