From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 16:29:45 +0100
Subject: [Buildroot] [PATCH 1/1] fix typo for libilclient.so on target
In-Reply-To: <1454944884-49410-1-git-send-email-michael.schenk@albistechnologies.com>
References: <1454944884-49410-1-git-send-email-michael.schenk@albistechnologies.com>
Message-ID: <20160208162945.3a76ee76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Schenk, Michael,

On Mon, 8 Feb 2016 16:21:24 +0100, Schenk, Michael wrote:
> Signed-off-by: Schenk, Michael <michael.schenk@albistechnologies.com>
> ---
>  package/rpi-userland/rpi-userland.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, I've applied after tweaking two things:

 - The commit title, which should always follow the format:

   <package>: <description>

   And also your commit title was talking about "target", but you're
   also fixing the "staging" installation. So all in all, I've changed
   the commit title to:

   rpi-userland: fix typos in the libilclient.so library installation

   For future patches, if you could use this convention for commit
   titles, it would be great.

 - The author/SoB lines, where for consistency reasons we prefer to
   have the first name before the last name. Yes, I know that depending
   on your geographical area, the common way of doing this is
   different, but Buildroot Git history uses "FirstName LastName
   <email>" everywhere, so I've changed this. If you can change your
   Git configuration to use this for future patches, it would be great.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
