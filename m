From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:07:46 +0200
Subject: [Buildroot] [PATCH 9/9] package/weston: add option to enable EGL
In-Reply-To: <7e31b6ba4a2f05ab5ba1b1114863e7d102fa5a17.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <7e31b6ba4a2f05ab5ba1b1114863e7d102fa5a17.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <20131010090746.51e21c34@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  9 Oct 2013 23:44:25 +0200, Yann E. MORIN wrote:
> +# Whether EGL support is needed
> +config BR2_PACKAGE_WESTON_EGL
> +    bool

Indentation should be done with a tab.

That said, I'm unsure about this patch: do we really want to add "dead"
code, that isn't being used for the moment? Shouldn't this wait for the
first EGL-based compositor to be added?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
