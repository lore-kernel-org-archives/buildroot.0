From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 28 Mar 2013 13:26:07 +0000
Subject: [Buildroot] [PATCH] rapidjson: new package
In-Reply-To: <20130328141527.0061ef53@skate>
References: <1364472920-11835-1-git-send-email-spdawson@gmail.com>
 <20130328141527.0061ef53@skate>
Message-ID: <CAHt8ZCOgUZq-WjNt=gFo+_f4Bmdu6KJHtXi25yzpDxShRYc-cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28 March 2013 13:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Simon,
>
>> +RAPIDJSON_INSTALL_TARGET = NO
>> +RAPIDJSON_INSTALL_STAGING = YES
>
> How does this thing work if you install only things in staging? Is it a
> code generator that runs on the host? And if so, shouldn't some stuff
> be installed in $(HOST_DIR) ?

Thanks for looking at this. It is a header-only library. That being
the case, should the headers also be installed under $(HOST_DIR)?

Simon.
