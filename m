From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 15 Jul 2014 20:38:46 +0200
Subject: [Buildroot] [PATCH 0 of 6] uclibc: fix handling of
	configuration file
In-Reply-To: <20140715193644.35ed9ab3@free-electrons.com>
References: <patchbomb.1405338624@localhost>
 <20140715193644.35ed9ab3@free-electrons.com>
Message-ID: <CAAXf6LXULkHDwBRszTYBN4VF4EwPJ2_8zDZiqi6RW64u_poVqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 15, 2014 at 7:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 14 Jul 2014 13:50:24 +0200, Thomas De Schampheleire wrote:
>
>> Thomas De Schampheleire (6):
>>     pkg-utils: kconfig helpers: add basic usage documentation
>>     pkg-utils: kconfig helpers: use single iso double quoting
>>     uclibc: replace custom kconfig helpers with those provided by pkg-utils
>>     uclibc: rename SETUP_DOT_CONFIG to FIXUP_DOT_CONFIG
>>     uclibc: menuconfig: take into account initial settings from config file
>>     uclibc: update-config: preserve freshly configured settings
>
> Patches 1 to 3 applied. The others are still in discussion.
>

Thanks, updated patches 4-6 coming up...
