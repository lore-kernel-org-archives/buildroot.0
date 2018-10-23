From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:14:53 +0100
Subject: [Buildroot] [scanrock 1/5] utils/scanrock: new utility for
 Luarocks infrastructure
In-Reply-To: <20181021163259.28335-2-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
 <20181021163259.28335-2-francois.perrad@gadz.org>
Message-ID: <7d286c1d-2363-9058-f59c-fd689ff68a52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 One more thing...

On 10/21/18 5:32 PM, Francois Perrad wrote:
> diff --git a/utils/scanrock b/utils/scanrock

 Two things are still missing in this script:

- a check that the package doesn't exist yet;

- a --force option to override that check.

 Regards,
 Arnout
