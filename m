From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 12:28:16 +0100
Subject: [Buildroot] [PATCH] buildroot:2011.02: Find compiler in
 environement path other than absolute path.
In-Reply-To: <1299755561-11490-1-git-send-email-sonic.adi@gmail.com>
References: <1299755561-11490-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20110310122816.3629b434@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Mar 2011 19:12:41 +0800
Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> In release 2011.02, external compiler is always prefixed by he
> customer path. When customer toolchain path is left empty, this patch
> avoids prefix absolute path.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
