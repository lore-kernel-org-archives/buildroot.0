From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:04:31 +0200
Subject: [Buildroot] [PATCH] package/faad2: add upstream security fixes
In-Reply-To: <202f3ce613cead8063357b6d9aae1da5f9bdcf09.1561985006.git.baruch@tkos.co.il>
References: <202f3ce613cead8063357b6d9aae1da5f9bdcf09.1561985006.git.baruch@tkos.co.il>
Message-ID: <79ad4303-e3cf-cc96-9a0e-a2ef2bb0892e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/07/2019 14:43, Baruch Siach wrote:
> CVE-2018-20194: Stack buffer overflow on invalid input
> 
> CVE-2018-20362: Null pointer dereference when processing crafted AAC
> input
> 
> Add two more crash fixes from upstream.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

 Regards,
 Arnout
