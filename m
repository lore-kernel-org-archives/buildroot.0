From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:14:32 +0200
Subject: [Buildroot] [PATCH v3] qt/qt5base: Fix INCLUDE_PATH when no
 JPEG/PNG support
In-Reply-To: <1438087248-14204-1-git-send-email-corjon.j@ecagroup.com>
References: <1438087248-14204-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150728231432.14c50036@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Tue, 28 Jul 2015 14:40:48 +0200, Julien Corjon wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/4be77432390c4cfb557c3f2cc52cf732de037949/
>   http://autobuild.buildroot.net/results/255a77e01d8af4090e03acb82f9ad93b7c4dd212/
>   http://autobuild.buildroot.net/results/7844e6a3eeecf67dc29277b73bfe714e4d8f0d85/
>   http://autobuild.buildroot.net/results/b941f35b6c8e1cf3b2c4b046dfcce98700d8f408/
>   http://autobuild.buildroot.net/results/c64b640a39285f59cde47cb8d06ab70a5ac97c8b/
>   http://autobuild.buildroot.net/results/f6d24b50f58251c8051d39bc1d09b5b43f81f441/
>   http://autobuild.buildroot.net/results/30acea45fb497942129ca57c143bab6174e14609/ 
>   http://autobuild.buildroot.net/results/f0891474fe2cd3e47b1489f147e31f698dbd013f/ 
> 
> Upstream-Status: https://codereview.qt-project.org/#/c/122145/
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> v2 -> v3 :
>   - Get Qt mainline patch (suggested by thomas)
> v1 -> v2 :
>  - Add autobuild references (suggested by thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
