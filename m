From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 20:31:25 +0200
Subject: [Buildroot] [PATCH v2] package/dcron: add patch to fix error
 message
In-Reply-To: <20190722002410.6707-1-unixmania@gmail.com>
References: <20190722002410.6707-1-unixmania@gmail.com>
Message-ID: <d5557c13-8147-cac2-6e08-585e2b99b7ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/07/2019 02:24, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The error message issued when the creation of the log file fails lacks
> an ending newline. Add a patch already submitted upstream[1] to fix it.
> 
> 1. https://github.com/dubiousjim/dcron/pull/22
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout
