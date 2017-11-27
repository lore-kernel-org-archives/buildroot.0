From: Mylene JOSSERAND <mylene.josserand@free-electrons.com>
Date: Mon, 27 Nov 2017 11:04:53 +0100
Subject: [Buildroot] [PATCH v2] rtl8723bu: new package
In-Reply-To: <CANCHnQqx-cQM-qW8_aFkCGB0yi=b32M8RC6rpeXXR73_NhTC_A@mail.gmail.com>
References: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
 <CANCHnQqx-cQM-qW8_aFkCGB0yi=b32M8RC6rpeXXR73_NhTC_A@mail.gmail.com>
Message-ID: <20171127110453.75713138@dell-desktop.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 27 Nov 2017 10:35:27 +0100,
Jeroen Roovers <jer@airfi.aero> a ?crit :

> On 27 November 2017 at 10:01, Myl?ne Josserand
> <mylene.josserand@free-electrons.com> wrote:
> > Add RTL8723BU package to compile the Realtek RTL8723BU Wifi
> > driver.  
> 
> I believe recent versions of the in-kernel rtlwifi driver cover the
> RTL8723BU as well. Is there any reason to prefer Realtek's driver? If
> there are important differences, then it may be useful to record the
> advantages of this driver in the Config.in help section.

Yes, I tried this driver and I did not succeed to make it work. I sent
an email on the mailing list "linux-wireless" about that[1]. I still do
not have an answer. It would be nice if it can work with mainline's 
driver.

I tested Realtek's driver and it is working just fine so I thought
to contribute the package, in case it could help others.

I can add it in the help section but maybe, the status of the mainline
driver will change so I do not know.

[1]:
https://www.mail-archive.com/linux-wireless at vger.kernel.org/msg40501.html

Thanks, 
Best regards,

Myl?ne Josserand
