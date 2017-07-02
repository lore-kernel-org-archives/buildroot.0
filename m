From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 1 Jul 2017 22:13:15 -0300
Subject: [Buildroot] [PATCH] nodm: uClibc wordexp support is enabled by
	default
In-Reply-To: <20170701100434.549d18ec@windsurf.home>
References: <20170627190743.GA3908@waldemar-brodkorb.de>
 <20170701100434.549d18ec@windsurf.home>
Message-ID: <CAAEAJfDCvJp65EPB4G70=MXdqmTjJMtrKsRYq0zXqpx0SuhsOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 July 2017 at 05:04, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 27 Jun 2017 21:07:43 +0200, Waldemar Brodkorb wrote:
>> Build tested with Qemu X86 sample.
>>
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>>  package/nodm/Config.in | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> Applied to master, thanks. The minnowboard_max-graphical_defconfig was
> using glibc until now, I guess mainly because of the nodm package not
> being available with uClibc. Now that nodm is available with uClibc,
> perhaps the minnowboard_max-graphical_defconfig can be changed to use
> uClibc ?
>
> Ezequiel ?
>

It's been a while. To be honest, I don't remember the reasons for glibc.
It could be more than just because of nodm, methinks.

Will test and send a patch if we get lucky.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
