From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Feb 2012 09:45:01 +0100
Subject: [Buildroot] [PATCH 1/2] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
References: <cover.1329651936.git.alvaro.gamez@hazent.com>
 <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
Message-ID: <201202200945.01513.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 19 February 2012 13:17:09 Alvaro G. M wrote:
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/27858d49/attachment-0001.html>
