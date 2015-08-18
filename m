From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:44:00 +0200
Subject: [Buildroot] [PATCH 2/3] package/neon: add host variant
In-Reply-To: <1439486091-6564-2-git-send-email-james.knight@rockwellcollins.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150818114400.2b08772f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu, 13 Aug 2015 13:14:50 -0400, James Knight wrote:
> Required by an upcoming host variant of the `rpm` package.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/neon/neon.mk | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Same comments as for beecrypt: all the BR2_PACKAGE_* options should not
be used to adjust the capabilities of the host package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
