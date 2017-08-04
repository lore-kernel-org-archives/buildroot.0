From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Aug 2017 19:27:38 +0200
Subject: [Buildroot] [PATCH 1/1] xmlstarlet: fix host package build
	errors.
References: <20170804010531.31789-1-Adamduskett@outlook.com>
 <40426826-4155-413f-069c-d288102081d3@mind.be>
Message-ID: <adne5ex2tj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Fri, 04 Aug 2017 17:36:00 +0200 schrieb Arnout Vandecappelle:

> Weird that the autobuilders didn't catch this. Ah, of course, it's only 
> a dependency of kodi and kodi never gets built because of the dependency
> on .py files...

this should not be the case anymore after https://git.buildroot.net/
buildroot-test/commit/?id=c0de21d9530af53eae5588d99d90c7e0cb87c543 unless 
the patch is not enough...

Regards, Bernd
