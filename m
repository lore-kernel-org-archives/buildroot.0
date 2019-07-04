From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 19:36:15 +0200
Subject: [Buildroot] [PATCH v2 19/27] autobuild-run: define output
 directory as part of Builder class
In-Reply-To: <20190703183159.3415-19-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
 <20190703183159.3415-19-itsatharva@gmail.com>
Message-ID: <6a17f564-a296-0494-5788-38345db4b230@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/07/2019 20:31, Atharva Lele wrote:
> Absolute path for output dir is required when using outputdir with
> system commands like make or tail. It was necessary because the
> relative path would be relative to the autobuilder script rather
> than the buildroot source directory.
> 
> It is OK to use an  absolute path everywhere because an absolute
> path is always correct.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
