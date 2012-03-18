From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 18:54:24 +0100
Subject: [Buildroot] [PATCH 1/3] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
References: <1331905375-9177-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <201203181854.24426.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 16 March 2012 14:42:53 Alvaro G. M wrote:
> From: "Alvaro G. M" <alvaro.gamez@hazent.com>
> 
> This modifies the definition of DOWNLOAD to receive two arguments:
> the first one is the full URL of the file to download, whereas the second
> (and optional) is the name the file will have once downloaded.
> 
> Same thing with the SOURCE_CHECK_WGET and SCP functions.
> 
> All calls to these functions have been changed to the shortest form of
> the new API, except for toolchains acquisition. Since there is quite a
> number of different toolchains this call to DOWNLOAD is better set to the
> generic one.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
