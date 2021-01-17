From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jan 2021 17:20:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libexif: set
 LIBEXIF_CPE_ID_VALID
In-Reply-To: <20210117152820.6bf7f1bb@windsurf.home>
References: <20210117141439.345753-1-fontaine.fabrice@gmail.com>
 <20210117152820.6bf7f1bb@windsurf.home>
Message-ID: <87sg6z614n.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jan 17 2021, Thomas Petazzoni wrote:
> On Sun, 17 Jan 2021 15:14:39 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
>> cpe:2.3:a:libexif_project:libexif is a valid CPE identifier for this
>> package:
>> 
>>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibexif_project%3Alibexif
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/libexif/libexif.mk | 1 +
>>  1 file changed, 1 insertion(+)
>
> Applied to master, thanks.

Not in master as of commit 6ed703646454 ("package/mpd: depends on gcc
and host gcc >= 7").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
