From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 2 Oct 2015 09:37:03 -0300
Subject: [Buildroot] [PATCH] tcpdump: drop unneeded security patches
In-Reply-To: <8eab1f5310d5dac8ab6e17bc5a0e4fdf5d3017ad.1443699935.git.baruch@tkos.co.il>
References: <8eab1f5310d5dac8ab6e17bc5a0e4fdf5d3017ad.1443699935.git.baruch@tkos.co.il>
Message-ID: <560E7A6F.2060508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/15 08:45, Baruch Siach wrote:

> Version 4.7.4 of tcpdump is not vulnerable to these issues according to:
>
>     https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8767
>     https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8768
>     https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8769
>
> The tcpdump commit log seems to indicate that these issues were fixes in a
> different way in the following commits:
>
> CVE-2014-8767: 4038f83ebf654804829b258dde5e0a508c1c2003
> CVE-2014-8768: 9255c9b05b0a04b8d89739b3efcb9f393a617fe9
> CVE-2014-8769: 9ed7ddb48fd557dc993e73f22a50dda6cedf4df7
>
> Just drop these patches.
>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

However i don't like upstream policy regarding vulns, there's no direct 
mention of these CVEs anywhere, it's very vague and hard to track.
Regards.
