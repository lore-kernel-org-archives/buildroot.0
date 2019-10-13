From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2019 22:35:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/clamav: select musl-fts if not
 glibc
In-Reply-To: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
References: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
Message-ID: <16cb64a6-f5a0-d51e-e8e0-c4b0d696493d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/2019 19:04, Fabrice Fontaine wrote:
> By selecting musl-fts, a build failure on internal fts is avoided
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8f0d45202c9a7dbb4d0c7431040384990f04008b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout
