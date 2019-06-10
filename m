From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 00:53:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
 1.8.6
In-Reply-To: <20190607061031.26643-1-bernd.kuhls@t-online.de>
References: <20190607061031.26643-1-bernd.kuhls@t-online.de>
Message-ID: <2805d7f1-ee48-a36c-f603-2b0e3aa5d0ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/06/2019 08:10, Bernd Kuhls wrote:
> Updated license hash after upstream commit
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/a1f3b4862e7fd44a37862ae84c0e79f89c9bc0d8

 This update adds the license conditions for the OpenH264 codec, which is
basically BSD-2c plus a patent license.

 However, I don't see BSD-2c in FREESWITCH_LICENSES. Is OpenH264 not used in the
Buildroot configuration?

 Regards,
 Arnout
