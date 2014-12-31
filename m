From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 17:05:59 +0100
Subject: [Buildroot] [PATCH v2 3/7] Adding libnice
In-Reply-To: <1418398967-2183-4-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-4-git-send-email-gregd72002@gmail.com>
Message-ID: <20141231170559.12bb9aae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:43 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>

Thanks, I've applied your patch, but after doing a fairly significant
set of changes. As detailed in the commit log:

    [Thomas:
     - Rename patch to the proper naming convention
     - Reduce patch to only take care of the IPv6 case
     - Add description in the patch
     - Propagate libglib2 dependencies in Config.in + added the
       corresponding comment.
     - Added a real help text, and fixed the help text indentation.
     - Fixed the comment header in the .mk file to have the right number
       of # signs.
     - Added the license informations
     - Added a dependency on host-pkgconf, used by the configure script
     - Added --without-gstreamer and --without-gstreamer-0.10 to be
       explicit about the fact that we don't support GStreamer in libnice
       for now.
     - Fixed the hash file to have the proper format.]

See http://git.buildroot.net/buildroot/commit/?id=89502b9d56ad4f06954fae55684ef21525ad2515.

May I suggest you to compare the final commit and your original patch,
so that you can see what the issues were, for your upcoming
contributions?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
