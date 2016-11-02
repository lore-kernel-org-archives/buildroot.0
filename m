From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:25:55 +0100
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.51.0 (security)
In-Reply-To: <20161102115231.1289-1-Vincent.Riera@imgtec.com>
References: <20161102115231.1289-1-Vincent.Riera@imgtec.com>
Message-ID: <20161102172555.742330d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Nov 2016 11:52:31 +0000, Vicente Olivert Riera wrote:
> List of fixed CVEs:
> 
> CVE-2016-8615: cookie injection for other servers
> CVE-2016-8616: case insensitive password comparison
> CVE-2016-8617: OOB write via unchecked multiplication
> CVE-2016-8618: double-free in curl_maprintf
> CVE-2016-8619: double-free in krb5 code
> CVE-2016-8620: glob parser write/read out of bounds
> CVE-2016-8621: curl_getdate read out of bounds
> CVE-2016-8622: URL unescape heap overflow via integer truncation
> CVE-2016-8623: Use-after-free via shared cookies
> CVE-2016-8624: invalid URL parsing with '#'
> CVE-2016-8625: IDNA 2003 makes curl use wrong host
> 
> Full ChangeLog:
> 
> https://curl.haxx.se/changes.html#7_51_0
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libcurl/libcurl.hash | 2 +-
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
