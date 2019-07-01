From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:18:33 +0200
Subject: [Buildroot] [PATCH 07/27] autobuild-run: move make_opts from
 kwargs to Builder class
In-Reply-To: <20190629050214.17852-7-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
 <20190629050214.17852-7-itsatharva@gmail.com>
Message-ID: <69fa55b4-0312-b8e1-6081-68ebe68b549d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:01, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - New patch, split accidental squash of niceness move and make_opts move
