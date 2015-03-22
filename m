From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:20:07 +0100
Subject: [Buildroot] [PATCH 3/7] pkg-generic: take into account
 <pkg>_EXTRA_DOWNLOADS to display "Downloading" message
In-Reply-To: <1425147313-17380-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EDDA7.2080803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> The .stamp_downloaded target displays the "Downloading" message even
> if there is really something to download. However, this logic only
> checks for <pkg>_SOURCE and <pkg>_PATCH: it does not check if
> something needs to be downloaded in <pkg>_EXTRA_DOWNLOADS.
> 
> This commit fixes that, which makes sure that the "Downloading"
> message is displayed if one of the items in <pkg>_EXTRA_DOWNLOADS has
> not yet been downloaded.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout
[snip[


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
