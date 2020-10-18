From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Oct 2020 07:12:58 +0300
Subject: [Buildroot] HTTPS Certificates not Trusted?
In-Reply-To: <CAKA8WzK+X_Qta0V0wAwhYOATAOsT4WcdtafvHZ=azU_-w+sxDA@mail.gmail.com>
References: <CAKA8WzK+X_Qta0V0wAwhYOATAOsT4WcdtafvHZ=azU_-w+sxDA@mail.gmail.com>
Message-ID: <87d01gw4s5.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Noah,

On Sun, Oct 18 2020, Noah Cain wrote:
> I am unable to load any files from online sources, because the system does
> not trust any certificates on any sites. What is going on? I assume that I
> need some form of ca-certificates, but I am not able to find that under any
> menus.

Try under Target packages ? Libraries ? Crypto ?  CA Certificates.

baruch

> Here is the output of wget, with various services.
> https://raw.githubusercontent.com/nmcain/nmcain.github.com/master/image.png

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
