From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Oct 2018 22:10:11 +0300
Subject: [Buildroot] [PATCH v1] gstreamer1-editing-services: fix libgtk3
 compile
In-Reply-To: <87a7nhd5ri.fsf@tkos.co.il>
References: <20181013175908.19693-1-ps.report@gmx.net>
 <87a7nhd5ri.fsf@tkos.co.il>
Message-ID: <878t31d5nw.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Baruch Siach writes:
>> + configure.ac | 19 +++----------------
>
> I guess you also need to add _AUTORECONF = YES.

Now I see that your v2 removes this patch.

Sorry for the noise.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
