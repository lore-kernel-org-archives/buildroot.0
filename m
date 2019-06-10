From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:22:04 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/samba4: drop third patch
In-Reply-To: <20190610085656.22736-1-fontaine.fabrice@gmail.com>
References: <20190610085656.22736-1-fontaine.fabrice@gmail.com>
Message-ID: <0ccdde13-9d2f-ad31-3aae-89154336e098@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 10:56, Fabrice Fontaine wrote:
> Drop third patch which is not upstreamable and set XSLTPROC to false
> instead to disable documentation
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Use false instead of False
[snip]
