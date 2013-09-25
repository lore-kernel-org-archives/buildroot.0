From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Sep 2013 16:36:53 +0200
Subject: [Buildroot] gnome package ?
In-Reply-To: <5242E01B.4040607@free.fr>
References: <5241AED5.1020903@free.fr> <5242E01B.4040607@free.fr>
Message-ID: <e5b330be-68be-407c-818d-a351aab19085@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"St?phane ANCELOT" <sancelot@free.fr> wrote:
>On 24/09/2013 17:25, St?phane ANCELOT wrote:
>> Hi,
>> I would like to know if I can build gnome ?
>>
>> Can you point me to the right direction?
>
>So, I suppose it is not provided ?
>

Currently, buildroot does indeed not have a recipe for gnome, not kde, only more simple window managers like fluxbox, enlightenment, etc. Since buildroot is mainly aimed at embedded devices, where gnome is not a typical option, I'm not sure if we even want that complexity and the vast amount of packages that come with it.

For your information, the manual (also available online) contains a list of packages currently available.

Best regards,
Thomas
