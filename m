From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:37:49 +0100
Subject: [Buildroot] [PATCH v3 2/7] libgtk3: bump to version 3.18.8
In-Reply-To: <1457517525-7716-3-git-send-email-gustavo@zacarias.com.ar>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
 <1457517525-7716-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320183749.20bd3132@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 06:58:40 -0300, Gustavo Zacarias wrote:
> Mark the wayland backend as good again since the bump and consequent
> protocol version mtach fixes it.
> 
> Switch backend selection to choice so that only one can be selected.

Where are you doing this? I don't see the backend selection being
changed to a kconfig "choice". Did I miss something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
