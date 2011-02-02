From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Feb 2011 20:12:11 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce HOST_DIR option
In-Reply-To: <1296651957-1633-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296651957-1633-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20110202201211.5b4b22e0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Feb 2011 10:05:56 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Allow the user to define HOST_DIR in the config menu.
> 
> This way when building an internal toolchain a separate (maybe shared)
> output directory may be defined and the toolchain can be used by
> multiple users and/or projects.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
