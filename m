From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 12:38:50 +0200
Subject: [Buildroot] [PATCH 1/1] beaglebone: better support for starting
 and creating images
In-Reply-To: <1394799202-15980-1-git-send-email-marcin.jabrzyk@gmail.com>
References: <1394799202-15980-1-git-send-email-marcin.jabrzyk@gmail.com>
Message-ID: <543A5A3A.2070605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/03/14 13:13, Marcin Jabrzyk wrote:
> - Added short readme file with description of first steps how to start.
> - Added uEnv.txt so the board can start from SDCard
> - Added post-image.sh script to copy included uEnv.txt to output/images
>
> Signed-off-by: Marcin Jabrzyk <marcin.jabrzyk@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I didn't actually test it in any way, but it looks good and Stephan tested it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
