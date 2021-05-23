From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 18:32:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: add dependency to
 BR2_INSTALL_LIBSTDCPP to examples
In-Reply-To: <20210520065428.16860-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Thu, 20 May 2021 08:54:29 +0200")
References: <20210520065428.16860-1-heiko.thiery@gmail.com>
Message-ID: <87fsyd5s2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > The examples require libstdc++.so.6 so add the required dependency to
 > the Config.in.

 >   ./tiger: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
