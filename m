From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 14:58:21 +0100
Subject: [Buildroot] [PATCH v5 10/15] qt5base: fix Vivante x11/EGL
	configuration
In-Reply-To: <1418132813-32642-11-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-11-git-send-email-jezz@sysmic.org>
Message-ID: <20141209145821.1bebbeae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:48 +0100, J?r?me Pouiller wrote:
> Fix compilation with Vivante headers and bug at runtime.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Could you add some justification as to why those patches touching
non-platform specific parts of Qt will continue to work on non-i.MX
platforms once those patches are applied? I'm especially thinking about
the 0001 patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
