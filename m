From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 13 Jul 2017 13:41:52 -0400
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20170713193211.158c47fc@windsurf>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170713193211.158c47fc@windsurf>
Message-ID: <CAFSsvmopWs57wMPDQn+FeQj5wyb8NGoGXk=AT8w9VjPpaa9cPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

75KB

On Thu, Jul 13, 2017 at 1:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 13 Jul 2017 10:25:48 -0400, Adam Duskett wrote:
>
>> Enabling fts support increases the size of uclibc by 75~kb according to
>
> 75 KB, or 5-7 KB ?
>
Whoops! My bad.
7.5k according to the menuconfig help.

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
