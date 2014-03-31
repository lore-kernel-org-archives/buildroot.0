From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 31 Mar 2014 11:22:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] xbmc: needs host-gawk
In-Reply-To: <l3am0bxq8o.ln2@ID-313208.user.individual.net>
References: <1396107529-23653-1-git-send-email-bluemrp9@gmail.com>
 <l3am0bxq8o.ln2@ID-313208.user.individual.net>
Message-ID: <CAGduivzt=Zu30HaYEyrLYdQrnfQ4hRszf-0mDuuipKVzwUet1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, all

Sorry for the delayed answer.
Thanks a lot for spotting this Ryan.

Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Sun, Mar 30, 2014 at 10:06 PM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
> Ryan Coe <bluemrp9@gmail.com> wrote in
> news:1396107529-23653-1-git-send-email-bluemrp9 at gmail.com:
>
>> Signed-off-by: Ryan Coe
>> <bluemrp9@gmail.com> ---
>> Changes v1 -> v2
>>   - Keep dependencies sorted
>> ---
>>  package/xbmc/xbmc.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
>> index 6dbbb7d..c36439e 100644
>> --- a/package/xbmc/xbmc.mk
>> +++ b/package/xbmc/xbmc.mk
>> @@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
>>  # called TexturePacker. It is responsible to take all the images used
>>  in the # GUI and pack them in a blob.
>>  # http://wiki.xbmc.org/index.php?title=TexturePacker
>> -XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
>> +XBMC_DEPENDENCIES = host-gawk host-gperf host-lzo host-sdl_image
>> host-swig
>>  XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper
>>  jpeg \
>>       libass libcdio libcurl libfribidi libgcrypt libmad libmodplug
>>       libmpeg2 \ libogg libplist libpng libsamplerate libungif libvorbis
>>       libxml2 lzo ncurses \
>
> Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
