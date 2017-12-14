From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Dec 2017 17:31:47 +0100
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <CANu7NGu1FYMpNv=Jc0ZRUnwHzuY1Vgra=u==K2xw5=Jod8B2pg@mail.gmail.com>
 (Sergio Prado's message of "Thu, 14 Dec 2017 14:14:44 -0200")
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
 <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
 <20171214064359.282d0412@windsurf.png.is.keysight.com>
 <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
 <CANu7NGu1FYMpNv=Jc0ZRUnwHzuY1Vgra=u==K2xw5=Jod8B2pg@mail.gmail.com>
Message-ID: <87tvwt2rv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

Hi,

 > So I see two possible options:

 > 1. Completely remove these options.
 > 2. Keep these options, documenting that to be useful, it needs out of tree
 > patches that are not public and should be requested via wolfssl website
 > contact page.

 > I'm okay with both options, but I think option 2 is better because it will
 > give Buildroot users the possibility to use wolfssl with
 > nginx/lighttpd/wpa_supplicant in a way the wolfssl project intended. What
 > do you think?

If these options cannot be tested in upstream Buildroot then they imho
shouldn't be there, so +1 for option 1.

-- 
Bye, Peter Korsgaard
