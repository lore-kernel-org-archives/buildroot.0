From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:07:13 +0100
Subject: [Buildroot] [PATCH 1/3] package/libva: backport Add pointer to
 struct wl_interface for driver to use
In-Reply-To: <1547299337-2266-1-git-send-email-james.hilliard1@gmail.com>
 (james's message of "Sat, 12 Jan 2019 21:22:15 +0800")
References: <1547299337-2266-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <87a7k0bc3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "james" == james hilliard1 <james.hilliard1@gmail.com> writes:

 > From: James Hilliard <james.hilliard1@gmail.com>
 > This is needed by libva-intel-driver when using wayland.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed after fixing the check-package warning, thanks:

package/libva/0001-Add-pointer-to-struct-wl_interface-for-driver-to-use.patch:4: generate your patches with 'git format-patch -N'


-- 
Bye, Peter Korsgaard
