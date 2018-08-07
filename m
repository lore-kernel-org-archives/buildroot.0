From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 7 Aug 2018 10:37:53 +0200
Subject: [Buildroot] [PATCH] libgit2: security bump to version 0.27.4
In-Reply-To: <04aaf275d91880ff5fa562ddd4177d0cbe386148.1533620000.git.baruch@tkos.co.il>
References: <04aaf275d91880ff5fa562ddd4177d0cbe386148.1533620000.git.baruch@tkos.co.il>
Message-ID: <b99ad249-8b3b-d1f4-ecbb-8a5fca3427e6@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/2018 07:33, Baruch Siach wrote:
> Fixes CVE-2018-10887 and CVE-2018-10888: out-of-bounds reads when
> reading objects from a packfile.
> 
> Also fixes out-of-bounds reads when processing smart-protocol "ng"
> packets (no known CVE yet).
> 
> Drop upstream patch.
> 
> Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Tested a few toolchains with test-pkg, the tests are not finished yet...
