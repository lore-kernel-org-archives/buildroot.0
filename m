From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:14:59 +0200
Subject: [Buildroot] [PATCHv5] fmt: new package
In-Reply-To: <1491493277-19334-1-git-send-email-semenak94@mail.ru>
References: <fmt: new package>
 <1491493277-19334-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170406221459.281f17ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 18:41:17 +0300, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> 
> Changes between v4 and v5:
>  - added dependcy from LIBSTDCPP to fmt
> 
> Changes between v3 and v4:
>  - fixed misprint
> 
> Changes between v2 and v3:
>  - removed Staging section in fmt.mk file
>  - formatting fixes
>  - added dependency from w/ C++
> 
> Changes between v1 and v2:
>  - formatting fixes
>  - added right license
>  - using Github helper to download
> ---
>  package/Config.in     |  1 +
>  package/fmt/Config.in | 10 ++++++++++
>  package/fmt/fmt.hash  |  4 ++++
>  package/fmt/fmt.mk    | 18 ++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/fmt/Config.in
>  create mode 100755 package/fmt/fmt.hash
>  create mode 100755 package/fmt/fmt.mk

Applied to master with the following changes:

    [Thomas:
     - add entry to DEVELOPERS file
     - add missing wchar dependency
     - minor tweaks.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
