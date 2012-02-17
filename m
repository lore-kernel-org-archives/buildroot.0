From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2012 10:14:03 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <CAM+bi4uQ6awKcBMN1h9Ps+gyKqXwbao=2_N1_rZtNT_hKcQP8A@mail.gmail.com>
References: <201202160040.17980.arnout@mind.be>
 <201202162338.52454.arnout@mind.be>
 <CAM+bi4uQ6awKcBMN1h9Ps+gyKqXwbao=2_N1_rZtNT_hKcQP8A@mail.gmail.com>
Message-ID: <201202171014.04114.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 17 February 2012 09:27:34 Alvaro Gamez wrote:
> Also, I didn't know one could do $(if $(2),$(2),$(notdir $(1)))), my make
> skills are pretty basic.

 I didn't test this, this is just based on looking at the make manual :-)
Better check if it indeed does work.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
