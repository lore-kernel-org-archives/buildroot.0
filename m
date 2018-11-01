From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Nov 2018 13:19:04 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <20181031213930.49837-1-mmayer@broadcom.com>
References: <20181031213930.49837-1-mmayer@broadcom.com>
Message-ID: <23d9ca8b-1c2a-5f1b-891e-5867b25d1ec7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/10/18 22:39, Markus Mayer wrote:
> Provide a simple mechanism to pass extra arguments to "mkdir" when
> creating download directories. This can be helpful if one needs the
> download directories to be writable multiple users ("shared download
> cache").

 I think having a Config.in option for this is way overkill. You can just make
the directory before calling Buildroot, right? And if it is a shared directory,
it should be created only once anyway.

 Regards,
 Arnout

[snip]
