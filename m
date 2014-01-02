From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:04:34 +0100
Subject: [Buildroot] [PATCH v2] qt5base: add an option to build and
 install examples
In-Reply-To: <1388646422-8396-1-git-send-email-fatih.asici@gmail.com>
References: <1388646422-8396-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20140102150434.2cb07a14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Thu,  2 Jan 2014 09:07:02 +0200, Fatih A??c? wrote:
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> ---
> Changes v1 -> v2:
>   - rebase against current master
>   - drop upstreamed patches
>   - no need to pass -compile-examples as it is default now
>   - add configure option using a one-line if block
> ---
>  package/qt5/qt5base/Config.in  |  7 +++++++
>  package/qt5/qt5base/qt5base.mk | 14 +++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
