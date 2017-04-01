From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:40:15 +0200
Subject: [Buildroot] [PATCH 1/9] package: use SPDX short identifier for
 OFL license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170401224015.036e7e89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 00:36:23 +0530, Rahul Bedarkar wrote:
> We want to use SPDX identifier for license string as much as possible.
> SPDX short identifier for OFLv1.0/OFLv1.1 is OFL-1.0/OFL-1.1.
> 
> This change is done using following command.
> find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/OFLv([1]\.[0-1])/OFL-\1/g'
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  package/cantarell/cantarell.mk                     | 2 +-
>  package/font-awesome/font-awesome.mk               | 2 +-
>  package/googlefontdirectory/googlefontdirectory.mk | 2 +-
>  package/inconsolata/inconsolata.mk                 | 2 +-
>  package/liberation/liberation.mk                   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Thanks, all 9 patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
