From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 04 Sep 2020 07:42:48 +0300
Subject: [Buildroot] [PATCH 1/7] package/perl-html-parser: bump to
 version 3.75
In-Reply-To: <20200903192538.GD14354@scaer>
References: <20200902150838.874797-1-francois.perrad@gadz.org>
 <20200903192538.GD14354@scaer>
Message-ID: <87v9gu2lvb.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann

On Thu, Sep 03 2020, Yann E. MORIN wrote:
> On 2020-09-02 17:08 +0200, Francois Perrad spake thusly:
>> now, license has its own file
>> 
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Whole series of 7 patches applied to master, thanks!

Patch 5/7 in this series ("package/perl-net-dns: bump to version 1.26")
is not in master as of commit acc1330d4a838 ("configs/qemu_riscv32_virt:
use Linux 5.4 kernel").

baruch

>> ---
>>  package/perl-html-parser/perl-html-parser.hash | 6 +++---
>>  package/perl-html-parser/perl-html-parser.mk   | 6 +++---
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
>> index f06ec034b..021ef26c6 100644
>> --- a/package/perl-html-parser/perl-html-parser.hash
>> +++ b/package/perl-html-parser/perl-html-parser.hash
>> @@ -1,6 +1,6 @@
>>  # retrieved by scancpan from http://cpan.metacpan.org/
>> -md5    eb7505e5f626913350df9dd4a03d54a8 HTML-Parser-3.72.tar.gz
>> -sha256 ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b HTML-Parser-3.72.tar.gz
>> +md5  65bf65aa8b34b35443e094010f991406  HTML-Parser-3.75.tar.gz
>> +sha256  ac6b5e25a8df7af54885201e91c45fb9ab6744c08cedc1a38fcc7d95d21193a9  HTML-Parser-3.75.tar.gz
>>  
>>  # computed by scancpan
>> -sha256 663867028ae22c6f2fabab11238f65f1bf8dd789233b844bead5f6d22220d160 README
>> +sha256  0e57338bc10d5fb8891012ebee65a7b504b247f5bb485e121b8b48d7a118a60b  LICENSE
>> diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
>> index 6e5a81bb7..93e4f6745 100644
>> --- a/package/perl-html-parser/perl-html-parser.mk
>> +++ b/package/perl-html-parser/perl-html-parser.mk
>> @@ -4,11 +4,11 @@
>>  #
>>  ################################################################################
>>  
>> -PERL_HTML_PARSER_VERSION = 3.72
>> +PERL_HTML_PARSER_VERSION = 3.75
>>  PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
>> -PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
>> +PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
>>  PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
>> -PERL_HTML_PARSER_LICENSE_FILES = README
>> +PERL_HTML_PARSER_LICENSE_FILES = LICENSE
>>  PERL_HTML_PARSER_DISTNAME = HTML-Parser
>>  
>>  $(eval $(perl-package))
>> -- 
>> 2.25.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
