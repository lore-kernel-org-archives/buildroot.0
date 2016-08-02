From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 02 Aug 2016 19:15:18 +0200
Subject: [Buildroot] [PATCH/RFC 1/1] package/libglob: new package
References: <1469982560-13681-1-git-send-email-bernd.kuhls@t-online.de>
 <1470083347.4303.12.camel@embedded.rocks>
Message-ID: <62177dxtet.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Am Mon, 01 Aug 2016 22:29:07 +0200 schrieb J?rg Krause:

> Hi,
> 
> On So, 2016-07-31 at 18:29 +0200, Bernd Kuhls wrote:
>> Needed for packages which need GLOB_BRACE & GLOB_NOMAGIC. These
>> defines
>> are not provided by musl toolchains.
>> 
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> sorry, I didn't noticed you already submitted a patch to add libglob. I
> submitted a similar patch, too:?http://lists.busybox.net/pipermail/buil
> droot/2016-August/168908.html.

yes, but your patch is better because it takes the static-only scenario
into account. Therefore I closed my patch in patchworks.

Regards, Bernd
