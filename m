From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:48:13 +0200
Subject: [Buildroot] [PATCH] dhcpdump: fix static build
In-Reply-To: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
Message-ID: <CACXmViZ8Ciadt+mE5d-xb1Sni3umA2SdEmwAtcJbfz087rDaSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 23, 2014 at 9:59 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Use pcap-config to list optional libpcap dependencies that we need to list
> when building statically.
>
> Fixes:
> http://autobuild.buildroot.net/results/110/1107c21cdf656763bf7048c6c5c7899369724f5f/
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
