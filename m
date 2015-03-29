From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:44:21 +0200
Subject: [Buildroot] [PATCH] yaml-cpp: requires boost
In-Reply-To: <1427571272-8465-1-git-send-email-fabio.porcedda@gmail.com>
References: <1427571272-8465-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150329134421.23a336d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sat, 28 Mar 2015 20:34:32 +0100, Fabio Porcedda wrote:
> The Boost C++ library is already selected in the Config.in but it was
> missing in the yaml-cpp.mk file.
> 
> Fix build failure:
> CMake Error at /home/tetsuya/buildroot/br/output/host/usr/share/cmake-3.1/Modules/FindBoost.cmake:1182 (message):
>   Unable to find the requested Boost libraries.
> <snip>
> make: *** [/home/tetsuya/buildroot/br/output/build/yaml-cpp-0.5.1/.stamp_configured] Error 1
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
