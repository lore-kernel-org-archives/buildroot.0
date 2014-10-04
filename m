From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 4 Oct 2014 19:28:51 +0200
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: rename
	_INSTALL_HOST_OPTS -> _INSTALL_OPTS
In-Reply-To: <20141004192136.0df6ae55@free-electrons.com>
References: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
 <20141004192136.0df6ae55@free-electrons.com>
Message-ID: <CAHXCMM+ne+JhMW0aXkNWHJEBBNGWDqiACgL4raqkM7OvmBEiQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Oct 4, 2014 at 7:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sat,  4 Oct 2014 19:19:02 +0200, Samuel Martin wrote:
>> This pacth renames, consistently with the other package infrastructures,
>> the _INSTALL_OPTS variable for host CMake-based package.
>>
>> As mentioned in [1], no host-cmake-package uses this variable so far; so
>> it is a safe rename.
>>
>> [1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html
>>
>> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/pkg-cmake.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> What about the manual?

There is no mention of _INSTALL_OPTS or _INSTALL_HOST_OPTS in the manual.
Shall I add one? (not even in the generic infra doc).

It seems host-package documentation is +/- missing in the manual. :-/

BTW, do not apply this patch, I forgot some occurence of the renaming.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Thanks,

-- 
Samuel
