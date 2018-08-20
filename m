From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 20:35:13 +0200
Subject: [Buildroot] [PATCH] liburiparser: bump to version 0.8.6
In-Reply-To: <146368874.1687439.1534786887521.JavaMail.zimbra@datacom.com.br>
 (Carlos Santos's message of "Mon, 20 Aug 2018 14:41:27 -0300 (BRT)")
References: <20180820001208.10551-1-casantos@datacom.com.br>
 <87sh392brh.fsf@dell.be.48ers.dk>
 <146368874.1687439.1534786887521.JavaMail.zimbra@datacom.com.br>
Message-ID: <87o9dw3mzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

Hi,

 >> Committed, thanks.
 >> 
 >> When was this issue introduced? 2018.02.x has 0.8.4.

 > Looking a the code it seems to predate 0.8.4 by several years since it
 > fixes a function that was introduced in 2008:

 >    https://github.com/uriparser/uriparser/commit/451eb07f3a289e0d1b7800629f4814bf6b48c121

Ok, thanks. I'll cherry pick this bump for 2018.02.x as well next time I
sync then.

-- 
Bye, Peter Korsgaard
