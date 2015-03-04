From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:43:39 +0100
Subject: [Buildroot] [PATCH next 1/1] package/portaudio: Remove threads
 dependency for alsa module
In-Reply-To: <1425124996-17097-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425124996-17097-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150304234339.63127ac2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 28 Feb 2015 13:03:16 +0100, Bernd Kuhls wrote:
> Portaudio as a whole already depends on threads support, so there is no
> need to have an additional dependency for its alsa module.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
