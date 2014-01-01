From: Mau Z <zmau1962@gmail.com>
Date: Wed, 1 Jan 2014 14:58:42 +0200
Subject: [Buildroot] Packages that fail to be downloaded
In-Reply-To: <20140101044126.GF4263@tarshish>
References: <CAPFcPTJtoK3p0kseX-kQ7wNUyh5A+T7fwVETc89UcANmZZzJxw@mail.gmail.com>
 <20140101044126.GF4263@tarshish>
Message-ID: <CAPFcPTJZhzS9L+vqh+CsFcNFhVSkP54vG-OtJYn8PooTNDJ+eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks,

I am using version 05.2013.
I did the work on a "Ubuntu 12.04"  (I used a  "fresh" machine to be
sure that nothing unknown creates troubles).
In any case, this was just for curiosity (at the moment I do not need
these packages).


Thanks
Mau


On Wed, Jan 1, 2014 at 6:41 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Mau,
>
> On Tue, Dec 31, 2013 at 11:58:25PM +0200, Mau Z wrote:
>> The following package downloads fail:
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> >>> vim 699f8d8f096d Downloading
>> Reason :   ERROR 404: Not Found.
>>
>> >>> >>> python-nfc 142 Downloading
>> Reason :   ERROR 404: Not Found.
>>
>> >>> dvb-apps 83c746462ccb Downloading
>> Reason :   ERROR 404: Not Found.
>
> I had no problem downloading any of the above. Do you have Mercurial and Bzr
> installed on your system?
>
>> >>> mxml 2.7 Downloading
>> Reason :   Server does not answer......
>> (http://ftp.easysw.com/pub/mxml/2.7/mxml-2.7.tar.gz)
>
> This URL has changed in version 2013.08 (commit dc6d9070b). What version of
> Buildroot are you using?
>
>> >>> xinetd 2.3.15 Downloading
>> failed: Connection timed out.
>
> www.xinetd.org is not responding here also. But automatic fall back to
> sources.buildroot.net works.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
