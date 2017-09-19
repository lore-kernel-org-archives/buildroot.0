From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:08:42 +0200
Subject: [Buildroot] [PATCH] openipmi: bump to version 2.0.24
In-Reply-To: <20170914041748.30905-1-joel@jms.id.au>
References: <20170914041748.30905-1-joel@jms.id.au>
Message-ID: <e2b40786-f87d-97b5-1a60-ed864c36ce52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 06:17, Joel Stanley wrote:
> Some changes in addition to the version bump:
> 
>  - The uint32_t patch is now upstream
>  - Drop --no-glib12 flag as support was removed in 2.0.23
>  - The host library path patch was refreshed
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

 Applied to master, thanks.

 Thanks, Bernd, for reviewing.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
