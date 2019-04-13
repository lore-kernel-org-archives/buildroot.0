From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:54:33 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5virtualkeyboard: fix
 legal-info failure
In-Reply-To: <20190412082455.65397-1-giulio.benetti@micronovasrl.com>
References: <4549a443-50cb-3a96-a390-4b68b6328f76@micronovasrl.com>
 <20190412082455.65397-1-giulio.benetti@micronovasrl.com>
Message-ID: <acfb55fa-cb03-8c49-73e6-ce4db22fe9d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 10:24, Giulio Benetti wrote:
> After version bump, all sha256 were updated, but not the changed license
> files paths for version 5.12.2.
> 
> Update license files paths for 5.12.2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3812f4a6313fab57766c7b98defa723c58a8fa76/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 Applied to master, thanks.

 Regards,
 Arnout
