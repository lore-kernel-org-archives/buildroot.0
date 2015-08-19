From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 21:17:32 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: install libQt5XcbQpa.so for
 xcb backend
In-Reply-To: <1439977695-2214-1-git-send-email-matthew.shyu.amlogic@gmail.com>
References: <1439977695-2214-1-git-send-email-matthew.shyu.amlogic@gmail.com>
Message-ID: <20150819211732.123b20f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Shyu,

On Wed, 19 Aug 2015 17:48:15 +0800, Matthew Shyu wrote:
> From: Matthew Shyu <matthew.shyu@amlogic.com>
> 
> libqxcb.so links again libQt5XcbQpa.so
> 
> Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
> ---
>  package/qt5/qt5base/qt5base.mk |    1 +
>  1 file changed, 1 insertion(+)

Thanks, good catch! I've slightly tweaked your commit message, and
applied. Thanks a lot!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
