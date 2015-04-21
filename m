From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 21 Apr 2015 21:33:23 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
In-Reply-To: <CANPyyuM0mRYTZ+1qEyDf+C83-B-=wOm0Vn__xxaVfFxvq663rA@mail.gmail.com>
References: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>
 <CANPyyuM0mRYTZ+1qEyDf+C83-B-=wOm0Vn__xxaVfFxvq663rA@mail.gmail.com>
Message-ID: <1429644803.4366.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Di, 2015-04-21 at 09:49 -0400, Mike Williams wrote:
> This now depends on lua, which is an optional dependency for swupdate
> (I don't use it).

This was suggested by Arnout to reduce the configuration complexity:
https://patchwork.ozlabs.org/patch/451763/

J?rg
