From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2011 20:31:09 +0100
Subject: [Buildroot] sshd and password problem
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835817820906@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835817820906@NBE-MBX01.americas.swk.pri>
Message-ID: <20110324203109.649841fa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Mar 2011 15:19:53 -0400
"Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:

> root:[deleted field]:0:0:99999:7:::

In our skeleton, this line is:

root::10933:0:99999:7:::

so it looks like you have changed this field.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
