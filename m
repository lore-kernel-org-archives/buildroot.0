From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 17:38:07 +0200
Subject: [Buildroot] [git commit] sam-ba: fix sam-ba symbolic link
In-Reply-To: <20180325202327.B36B183B60@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Mar 2018 22:23:12 +0200")
References: <20180325202327.B36B183B60@busybox.osuosl.org>
Message-ID: <87d0zbgh7k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b3b5608b47525799b0601d45939d3bae545fd124
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Following the removal of $(HOST_DIR)/usr, the symbolic link from
 > $(HOST_DIR)/bin/sam-ba/ to $(HOST_DIR)/opt/sam-ba/sam-ba was broken,
 > so we fix this.

 > In addition, sam-ba being prebuilt, it comes in two separates
 > binaries, one for x86 and the other for x86_64, so we take this into
 > account as well.

 > Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
 > [Thomas:
 >  - add spaces around = signs
 >  - rework commit log.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
