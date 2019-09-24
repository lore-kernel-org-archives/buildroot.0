From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Sep 2019 22:21:06 +0200
Subject: [Buildroot] [PATCH] exfat,
 exfat-utils: fix the installation path of the helper utilities
In-Reply-To: <CAJ4jsacJOpu9=dHx6snoJBAa72GWy5DROovzRiWgtD7dhgP9Kw@mail.gmail.com>
References: <466c3d76-7b83-90e6-27f2-aa78f70d47aa@grandegger.com>
 <8aa9f55b-bf31-fd19-74e4-27adbf9b1fca@mind.be>
 <CAJ4jsadgAdMk9kcqWws8Mcw471GK60ze+ixTQDmrObdMcYRrBA@mail.gmail.com>
 <CAJ4jsacJOpu9=dHx6snoJBAa72GWy5DROovzRiWgtD7dhgP9Kw@mail.gmail.com>
Message-ID: <e926f4fc-56f0-0736-914c-d7c1786ddfda@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/09/2019 00:37, Carlos Santos wrote:
> Which by the way reminds me that --prefix=/usr is passed by 46 .mk
> packages, which seems to be redundant.

 Of these, most are not autotools packages so the --prefix is not passed by default.

 And the ones which are autotools packages override CONFIGURE_CMDS.

 I couldn't find any case where the --prefix is redundant.

 But thanks for thinking of this anyway :-)

 Regards,
 Arnout
