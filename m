From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Apr 2013 08:57:53 +0200
Subject: [Buildroot] Failure at: linux 3.7.8 Installing to target
In-Reply-To: <1365980028.4087.41.camel@station1> (Ormund Williams's message of
 "Sun, 14 Apr 2013 18:53:48 -0400")
References: <1365886506.4087.37.camel@station1>
 <87ip3pow88.fsf@dell.be.48ers.dk> <1365980028.4087.41.camel@station1>
Message-ID: <8738usnuvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

 Ormund> On Sun, 2013-04-14 at 19:31 +0200, Peter Korsgaard wrote:
 >> Probably you misspelled the dtb filename. Verify that the name you
 >> selected in BR2_LINUX_KERNEL_INTREE_DTS_NAME exists under arch/<ARCH>/boot/.
 >> 
 Ormund> Never mind entirely my error, selected device tree support in error.
 Ormund> Thanks for the clue.

No problem. I've pushed a patch to make BR generate a clearer error
message if the user forgets to specify a dts file.

-- 
Bye, Peter Korsgaard
