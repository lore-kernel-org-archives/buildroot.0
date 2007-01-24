From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 18:04:08 +0100
Subject: [Buildroot] netcat returns
In-Reply-To: <78e18a710701191506v7b60784do56b89d9c8a7d00cc@mail.gmail.com>
References: <78e18a710701161527k16cb2503x2d728ad6deac6185@mail.gmail.com>
	<20070117093130.GA25996@aon.at>
	<78e18a710701191506v7b60784do56b89d9c8a7d00cc@mail.gmail.com>
Message-ID: <20070124170408.GB13003@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 20, 2007 at 12:06:44AM +0100, iks hefem wrote:
>2007/1/17, Bernhard Fischer <rep.dot.nop@gmail.com>:
>>Please make a complete svn diff --diff-cmd diff -x -rdup package/ >
>>~/buildroot.add-package-netcat.diff  and test it.
>>
>>The patch you link to above does hardcode "tar xzf" which is not
>>acceptable. Fix it to do what all other packages do (NETCAT_ZCAT etc).
>>The CC_FOR_BUILD is nowadays already contained in the
>>TARGET_CONFIGURE_OPTS, so remove it.
>
>OK, that was finally done (in fact, it wasn't that hard) & tested OK
>with current SVN. I did as you said, put it in and optionnally hid it
>if busybox option is enabled.
>
>>Oh, and i, personally, would prefer to use the version that comes with
>>debian
>
>OK, I didn't went that far but I will see if I can submit such a patch.

Please do.
I have applied it meanwhile. Thanks!
