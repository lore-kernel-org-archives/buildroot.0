From: Ganesh <ganesh45in@gmail.com>
Date: Mon, 4 May 2020 03:45:19 -0500 (CDT)
Subject: [Buildroot] When building the net-next kernel,
 buildroot is asking for all the kernel config options one by one to
 enable
In-Reply-To: <1588163575379-0.post@n4.nabble.com>
References: <1588163575379-0.post@n4.nabble.com>
Message-ID: <1588581919728-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This issue is resolved by installing gcc plugins in my host system.

s*udo apt-get install -y gcc-7-plugin-dev*

After this, buildroot does not ask 

GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW)

and the kernel build is proceeding as expected.

But am not sure how this is helping in resolving the issue. Can anyone
explain how installing the gcc plugins in the host system helps ?



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
