From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 11:12:11 +0100
Subject: [Buildroot] rsyslog plugin selection
In-Reply-To: <CAAXf6LU7juM840CBNO7=wus8H_OUuByzNW7jwKZ36GX4dp9c9Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 9 Feb 2017 10:43:40
 +0100")
References: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
 <8737fopew4.fsf@dell.be.48ers.dk>
 <CAAXf6LU7juM840CBNO7=wus8H_OUuByzNW7jwKZ36GX4dp9c9Q@mail.gmail.com>
Message-ID: <87poiroepw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > I should have mentioned it in my original mail, but the amount of
 > plugins is about 50:
 > http://www.rsyslog.com/plugins/

FYI, not all of them sounds useful (E.G. solaris) or we don't have the
needed dependencies in BR (relp, hdfs, ..)

Do we have the n
 > Nevertheless, I do think that using separate options is indeed the
 > best approach. To limit the visual impact in the config editor, I
 > would group them in a submenu instead of flat in the main menu.

 > Do you agree?

Yes, I agree. It is quite a lot of options, but not really worse than
the gst1-plugins-* stuff.

-- 
Bye, Peter Korsgaard
