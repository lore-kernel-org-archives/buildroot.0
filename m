From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Sep 2013 22:02:27 +0200
Subject: [Buildroot] [PATCH] ubifs filesystem image: line up and improve
	Config.in options
In-Reply-To: <7569d4f06765d241b20a.1378632798@argentina> (Thomas De
 Schampheleire's message of "Sun, 08 Sep 2013 11:33:18 +0200")
References: <7569d4f06765d241b20a.1378632798@argentina>
Message-ID: <8761u5rep8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> Triggered by the 'some comment required here', this patch updates the Config.in
 Thomas> comments for the ubifs filesystem image options. This includes:
 Thomas> - 'erase block' --> 'eraseblock' (following mtd online documentation)
 Thomas> - remove 'UBI' prefix to make options uniform. Sometimes the option is not a
 Thomas>   property of UBI but rather of the flash. Also, line up the name of the option
 Thomas>   with the help of mkfs.ubifs.
 Thomas> - add help text on all options, referring to the mkfs.ubifs/ubinize options

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
