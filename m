From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:29:31 +0200
Subject: [Buildroot] [PATCH 22/27] autobuild-run: move get_branch() to
 Builder class
In-Reply-To: <20190629050214.17852-22-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
 <20190629050214.17852-22-itsatharva@gmail.com>
Message-ID: <d19c088d-6abd-d511-1590-b450b0b1365b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:02, Atharva Lele wrote:
> get_branch() requires http_url and is only called inside
> Builder class. Moving it to builder class makes http_url
> available to it and makes the Builder class cohesive.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
