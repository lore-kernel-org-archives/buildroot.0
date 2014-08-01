From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 1 Aug 2014 21:42:48 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] uclibc: convert to
	kconfig-package infrastructure
In-Reply-To: <20140731210717.GL3960@free.fr>
References: <patchbomb.1406750281@localhost>
 <083076145a2b191e2b6a.1406750284@localhost>
 <20140731210717.GL3960@free.fr>
Message-ID: <CAAXf6LXy=aUaO23sXiwpBybggjLdiLf4gFeZcVsiQZHMOR8CnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Jul 31, 2014 at 11:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
>> This patch converts the uclibc package to the new kconfig-package
>> infrastructure, thus removing code duplication and ensuring a consistent
>> behavior of kconfig packages.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> However, I'd suggest a small enhancement (for a future patch):
>     UCLIBC_KCONFIG_EDITORS = menuconfig nconfig

Unless I'm missing something, this is not possible without patching
uclibc, because their makefiles do not define any other config editor
than menuconfig...

Best regards,
Thomas
