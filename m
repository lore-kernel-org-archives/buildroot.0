From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 16 Dec 2009 18:15:52 +0100
Subject: [Buildroot] avahi dependencies on host tools
In-Reply-To: <20091216154756.7e5b3db2@surf>
References: <20091216102451.339e6ba9@surf>
	<5f2b60912160550x6d3ae47eu4f625f0259737e95@mail.gmail.com>
	<20091216154756.7e5b3db2@surf>
Message-ID: <5f2b60912160915i4078abe0vf47bcd17103096f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/16 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Wed, 16 Dec 2009 14:50:26 +0100,
> Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :
>
>> IMHO, I'd like for Buildroot to build the least amount of host tools
>> so that build times can be kept down. I often start from
>> scratch... :-)
>
> True, but on the other hand, the approach we've been following since
> Buildroot maintenance has been taken over by Peter is that we should
> only rely on "basic" tools on the host. That's the reason why we build
> autoconf, automake, glib, pkg-config and other stuff for the host as
> needed. It makes the compilation process a little longer, but on the
> other hand, it makes the build process a *lot* more predictable.
>
> In the past, we had tons of reports of build failures that were caused
> by issues in varying versions of the host tools. And these problems are
> particularly annoying since the Buildroot developers often can't
> reproduce them.

I see. And I do understand that having predictable builds is important. I'm
just a bit afraid that Buildroot will turn into OpenEmbedded some day :-)

Best regards,
Bj?rn Forsman
