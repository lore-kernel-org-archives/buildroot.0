From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 20:02:12 +0200
Subject: [Buildroot] [PATCH] Update config.guess to version 2013-06-10
In-Reply-To: <E720F69E63F812489DA4D50AB9BE43F48B1A5E41@ESEXE002.espotel.espotel.fi>
References: <1378960962-17411-1-git-send-email-jouko.nikula@espotel.com>
 <87eh8uqxdc.fsf@dell.be.48ers.dk>
 <E720F69E63F812489DA4D50AB9BE43F48B1A5E41@ESEXE002.espotel.espotel.fi>
Message-ID: <20130915200212.12bc35b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nikula Jouko,

On Fri, 13 Sep 2013 05:51:39 +0000, Nikula Jouko wrote:

> Ok, I missed the readme and patches totally. Now I tried to apply the patches, but  they can't be applied to the new version of config.guess. I'll see if I can recreate the patches and apply them.

Note that I think we could drop the patch
0002-config-add-support-for-ps2.patch. It really doesn't seem to be
useful for any sort of machine we support.

Thoma
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
