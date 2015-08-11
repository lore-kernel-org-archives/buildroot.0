From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 19:43:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/jsoncpp: Broken on musl
References: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
 <1439146794.12501.25.camel@embedded.rocks>
 <kunk9cxek9.ln2@ID-313208.user.individual.net>
 <1439189938.14443.3.camel@embedded.rocks>
Message-ID: <7qop9cxrjq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 10 Aug 2015 08:58:58 +0200 schrieb J?rg Krause:

> On So, 2015-08-09 at 21:57 +0200, Bernd Kuhls wrote:
>> Hi J?rg,
>> 
>> Am Sun, 09 Aug 2015 20:59:54 +0200 schrieb J?rg Krause:
>> 
>> > After a short investigation [1] I realized this error only applies
>> > for x86 targets.
>> > 
>> > [1] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html
>> 
>> v1 of my patch tried to fix it that way but it does not work for
>> external toolchains: http://patchwork.ozlabs.org/patch/460337/
> 
> I see! How about something like depends on !(BR2_i386 || BR2_x86_64) &&
> !BR2_TOOLCHAIN_USES_MUSL?

Hi J?rg,

lgtm.

Regards, Bernd
