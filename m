From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:49:41 +0200
Subject: [Buildroot] [PATCH 1/3] gettext: fixup library permissions
In-Reply-To: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130918184941.6e0271d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Sep 2013 10:38:01 -0300, Gustavo Zacarias wrote:
> libintl.so* is installed without +x permissions thus preventing
> stripping. Fix it up in the post install target hooks.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

There are apparently a few other packages affected by this, see
http://patchwork.ozlabs.org/patch/246622/.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
