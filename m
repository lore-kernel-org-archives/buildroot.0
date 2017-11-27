From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 27 Nov 2017 10:35:27 +0100
Subject: [Buildroot] [PATCH v2] rtl8723bu: new package
In-Reply-To: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
References: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
Message-ID: <CANCHnQqx-cQM-qW8_aFkCGB0yi=b32M8RC6rpeXXR73_NhTC_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 November 2017 at 10:01, Myl?ne Josserand
<mylene.josserand@free-electrons.com> wrote:
> Add RTL8723BU package to compile the Realtek RTL8723BU Wifi driver.

I believe recent versions of the in-kernel rtlwifi driver cover the
RTL8723BU as well. Is there any reason to prefer Realtek's driver? If
there are important differences, then it may be useful to record the
advantages of this driver in the Config.in help section.


Kind regards,
     jer
