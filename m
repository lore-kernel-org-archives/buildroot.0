From: =?ISO-8859-1?Q?P=E4r_Degerman?= <par@degerman.org>
Date: Tue, 22 Mar 2011 21:31:02 +0100
Subject: [Buildroot] Adding owfs to buildroot fails with "cannot find
	/lib//libc.so.0"
In-Reply-To: <AANLkTinhuHrKgnufO1mpJ6rbqqLiOv8T3gPsVuJZEarF@mail.gmail.com>
References: <AANLkTikv8x-OmUoOvhJF-3Ly-fV6oLRzSKYY1ZP8s3R5@mail.gmail.com>
	<AANLkTinhuHrKgnufO1mpJ6rbqqLiOv8T3gPsVuJZEarF@mail.gmail.com>
Message-ID: <AANLkTik2NRrzq81T=M4fadTW2YuPVSBgS20iYYHNWi7B@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anders,
Nice to hear from you again. It's been a while!

> To me it looks like the host ld and /lib. Is it building a native-version?

No, I'm trying to cross compile for my target (i486) on my build host (i686).

> Do the configure step run OK?

Yes, the config.log is attached.

>> OWFS_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib"
>
> To me, it looks like this line is giving you you're problems.
>
> What linking problems are you trying to avoid by that line?

Those where left overs from me trying to work around the problem I am
having. I have the same result without this line though.

Regards
P?r
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 192366 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110322/824f2ed7/attachment-0001.bin>
