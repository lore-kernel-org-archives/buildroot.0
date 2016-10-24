From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:33:44 +0200
Subject: [Buildroot] [PATCH v3] toolchain/wrapper: fix 'reinstall'
In-Reply-To: <1475049656-12452-1-git-send-email-jezz@sysmic.org>
References: <1475049656-12452-1-git-send-email-jezz@sysmic.org>
Message-ID: <20161024233344.4c51d87f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Sep 2016 10:00:56 +0200, J?r?me Pouiller wrote:
> toolchain-wrapper was not reinstalled. So rules toolchain-external-reinstall,
> gcc-initial-reinstall, gcc-final-reinstall didn't work as expected.
> 
> In add, normalize variable name: s/TOOLCHAIN_BUILD_WRAPPER/TOOLCHAIN_WRAPPER_BUILD/
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>   - Fix missed occurences of TOOLCHAIN_BUILD_WRAPPER in package/
>   - Do not write intermediate file with sources
>   - Use 'install' instead of 'mkdir'
>   - Fix indentation
> v3:
>   - Change patch subject since it is not specific to toolchain-external
>   - Forgot to add TOOLCHAIN_WRAPPER_INSTALL to gcc POST_INSTALL_HOOKS
>   - Fix TOOLCHAIN_WRAPPER_INSTALL

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
