From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 11:18:06 -0300
Subject: [Buildroot] [git commit] stunnel: bump to version 4.44
In-Reply-To: <4E9B16D9.2070200@free-electrons.com>
References: <20111015213701.E38898E24C@busybox.osuosl.org>
 <4E9A9A26.2050409@free-electrons.com>
 <2247f2bf1f89d0ba0b3eba6b94afe5d1@zacarias.com.ar>
 <4E9B16D9.2070200@free-electrons.com>
Message-ID: <89474279e6dcb7b87978550390da88fb@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16.10.2011 14:39, Maxime Ripard wrote:

> Also, how the mirror is generated ? At each release or at a given
> frequency ? Because, in the first case, if a new version is released
> between this commit and the release, we're screwed.
>
>> Maybe fallback/alternate download URLs could be implemented?
>
> Indeed, that's a good idea.

I've just sent a patch for mirror support in the package infrastructure 
and for stunnel to use it.
Open to comments now :)
Regards.
